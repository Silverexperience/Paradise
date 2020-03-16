var/global/current_date_string

/obj/machinery/computer/account_database
	name = "Accounts Uplink Terminal"
	desc = "Access transaction logs, account data and all kinds of other financial records."
	icon_screen = "accounts"
	density = 1
	req_one_access = list(ACCESS_HOP, ACCESS_CAPTAIN, ACCESS_CENT_COMMANDER)
	var/receipt_num
	var/machine_id = ""
	var/obj/item/card/id/held_card
	var/datum/money_account/detailed_account_view
	var/creating_new_account = 0
	var/activated = 1
	var/const/fund_cap = 1000000

	light_color = LIGHT_COLOR_GREEN

/obj/machinery/computer/account_database/New()
	if(!station_account)
		create_station_account()

	if(department_accounts.len == 0)
		for(var/department in station_departments)
			create_department_account(department)
	if(!vendor_account)
		create_department_account("Vendor")
		vendor_account = department_accounts["Vendor"]

	if(!current_date_string)
		current_date_string = "[time2text(world.timeofday, "DD Month")], [game_year]"

	machine_id = "[station_name()] Acc. DB #[num_financial_terminals++]"
	..()

/obj/machinery/computer/account_database/proc/get_access_level(var/mob/user)
	if(user.can_admin_interact())
		return 2
	if(!held_card)
		return 0
	if(ACCESS_CENT_COMMANDER in held_card.access)
		return 2
	else
		for(var/a in held_card.access)
			if(a == ACCESS_HOP || a == ACCESS_CAPTAIN)
				return 1

/obj/machinery/computer/account_database/proc/accounting_letterhead(report_name)
	return {"
		<center><h1><b>[report_name]</b></h1></center>
		<center><small><i>[station_name()] Accounting Report</i></small></center>
		<hr>
		<u>Generated By:</u> [held_card.registered_name], [held_card.assignment]<br>
	"}

/obj/machinery/computer/account_database/attackby(obj/O, mob/user, params)
	if(!istype(O, /obj/item/card/id))
		return ..()

	if(!held_card)
		user.drop_item()
		O.loc = src
		held_card = O

		SSnanoui.update_uis(src)

	attack_hand(user)

/obj/machinery/computer/account_database/attack_hand(mob/user as mob)
	ui_interact(user)

/obj/machinery/computer/account_database/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)
	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "accounts_terminal.tmpl", src.name, 400, 640)
		ui.open()

/obj/machinery/computer/account_database/ui_data(mob/user, ui_key = "main", datum/topic_state/state = default_state)
	var/data[0]

	data["src"] = UID()
	data["id_inserted"] = !!held_card
	data["id_card"] = held_card ? text("[held_card.registered_name], [held_card.assignment]") : "-----"
	data["access_level"] = get_access_level(user)
	data["machine_id"] = machine_id
	data["creating_new_account"] = creating_new_account
	data["detailed_account_view"] = !!detailed_account_view
	data["station_account_number"] = station_account.account_number
	data["transactions"] = null
	data["accounts"] = null

	if(detailed_account_view)
		data["account_number"] = detailed_account_view.account_number
		data["owner_name"] = detailed_account_view.owner_name
		data["money"] = detailed_account_view.money
		data["suspended"] = detailed_account_view.suspended

		var/list/trx[0]
		for(var/datum/transaction/T in detailed_account_view.transaction_log)
			trx.Add(list(list(\
				"date" = T.date, \
				"time" = T.time, \
				"target_name" = T.target_name, \
				"purpose" = T.purpose, \
				"amount" = T.amount, \
				"source_terminal" = T.source_terminal)))

		if(trx.len > 0)
			data["transactions"] = trx

	var/list/accounts[0]
	for(var/i=1, i<=all_money_accounts.len, i++)
		var/datum/money_account/D = all_money_accounts[i]
		accounts.Add(list(list(\
			"account_number"=D.account_number,\
			"owner_name"=D.owner_name,\
			"suspended"=D.suspended ? "SUSPENDED" : "",\
			"account_index"=i)))

	if(accounts.len > 0)
		data["accounts"] = accounts

	return data

/obj/machinery/computer/account_database/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["insert_card"])
		if(held_card)
			held_card.forceMove(loc)

			if(ishuman(usr) && !usr.get_active_hand())
				usr.put_in_hands(held_card)
			held_card = null

		else
			var/obj/item/I = usr.get_active_hand()
			if(istype(I, /obj/item/card/id))
				var/obj/item/card/id/C = I
				usr.drop_item()
				C.forceMove(src)
				held_card = C

	if(!get_access_level(usr))
		return 1

	var/datum/nanoui/ui = SSnanoui.get_open_ui(usr, src, "main")

	if(href_list["choice"])
		switch(href_list["choice"])
			if("create_account")
				creating_new_account = 1

			if("toggle_suspension")
				if(detailed_account_view)
					detailed_account_view.suspended = !detailed_account_view.suspended

			if("finalise_create_account")
				var/account_name = href_list["holder_name"]
				var/starting_funds = max(text2num(href_list["starting_funds"]), 0)

				starting_funds = Clamp(starting_funds, 0, station_account.money)	// Not authorized to put the station in debt.
				starting_funds = min(starting_funds, fund_cap)						// Not authorized to give more than the fund cap.

				var/datum/money_account/M = create_account(account_name, starting_funds, src)
				if(starting_funds > 0)
					station_account.charge(starting_funds, null, "New account activation",
					 "", "New account activation", M.owner_name)

					creating_new_account = 0
					ui.close()

				creating_new_account = 0

			if("view_account_detail")
				var/index = text2num(href_list["account_index"])
				if(index && index <= all_money_accounts.len)
					detailed_account_view = all_money_accounts[index]

			if("view_accounts_list")
				detailed_account_view = null
				creating_new_account = 0

			if("print")
				var/text
				playsound(loc, 'sound/goonstation/machines/printer_thermal.ogg', 50, 1)
				var/obj/item/paper/P = new(loc)
				if(detailed_account_view)
					P.name = "account #[detailed_account_view.account_number] details"
					var/title = "Account #[detailed_account_view.account_number] Details"
					text = {"
						[accounting_letterhead(title)]
						<u>Holder:</u> [detailed_account_view.owner_name]<br>
						<u>Balance:</u> $[detailed_account_view.money]<br>
						<u>Status:</u> [detailed_account_view.suspended ? "Suspended" : "Active"]<br>
						<u>Transactions:</u> ([detailed_account_view.transaction_log.len])<br>
						<table>
							<thead>
								<tr>
									<td>Timestamp</td>
									<td>Target</td>
									<td>Reason</td>
									<td>Value</td>
									<td>Terminal</td>
								</tr>
							</thead>
							<tbody>
						"}

					for(var/datum/transaction/T in detailed_account_view.transaction_log)
						text += {"
									<tr>
										<td>[T.date] [T.time]</td>
										<td>[T.target_name]</td>
										<td>[T.purpose]</td>
										<td>[T.amount]</td>
										<td>[T.source_terminal]</td>
									</tr>
							"}

					text += {"
							</tbody>
						</table>
						"}

				else
					P.name = "financial account list"
					text = {"
						[accounting_letterhead("Financial Account List")]

						<table>
							<thead>
								<tr>
									<td>Account Number</td>
									<td>Holder</td>
									<td>Balance</td>
									<td>Status</td>
								</tr>
							</thead>
							<tbody>
					"}

					for(var/i=1, i<=all_money_accounts.len, i++)
						var/datum/money_account/D = all_money_accounts[i]
						text += {"
								<tr>
									<td>#[D.account_number]</td>
									<td>[D.owner_name]</td>
									<td>$[D.money]</td>
									<td>[D.suspended ? "Suspended" : "Active"]</td>
								</tr>
						"}

					text += {"
							</tbody>
						</table>
					"}

				P.info = text
				visible_message("<span class='notice'>[src] prints out a report.</span>")

	return 1
