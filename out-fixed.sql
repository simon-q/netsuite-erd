CREATE TABLE Accounts (
    account_extid VARCHAR(255),
    account_id NUMERIC(39, 0) PRIMARY KEY,
    accountnumber VARCHAR(60),
    cashflow_rate_type VARCHAR(10),
    category_1099_misc VARCHAR(60),
    category_1099_misc_mthreshold NUMERIC(20, 2),
    class_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    deferral_account_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    description VARCHAR(25),
    full_description VARCHAR(60),
    full_name VARCHAR(4000),
    general_rate_type VARCHAR(10),
    is_balancesheet VARCHAR(1),
    is_included_in_elimination VARCHAR(1),
    is_included_in_reval VARCHAR(1),
    is_including_child_subs VARCHAR(3),
    is_leftside VARCHAR(1),
    is_summary VARCHAR(3),
    isinactive VARCHAR(3),
    legal_name VARCHAR(400),
    location_id NUMERIC(39, 0),
    name VARCHAR(93),
    openbalance NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    type_name VARCHAR(128),
    type_sequence NUMERIC(39, 0)
);

CREATE TABLE Account_activity (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    activity_date TIMESTAMP,
    amount NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    is_hidden_custom_line VARCHAR(3),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (account_id, accounting_book_id, activity_date, department_id, is_hidden_custom_line, subsidiary_id)
);

CREATE TABLE Account_period_activity (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    amount NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    is_hidden_custom_line VARCHAR(3),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (account_id, accounting_book_id, accounting_period_id, department_id, is_hidden_custom_line, subsidiary_id)
);

CREATE TABLE Account_period_activity_pe (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    amount NUMERIC(39, 0),
    balance_from_subsidiary_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    is_hidden_custom_line VARCHAR(3),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (account_id, accounting_book_id, accounting_period_id, balance_from_subsidiary_id, department_id, is_hidden_custom_line, subsidiary_id)
);

CREATE TABLE Account_subsidiary_map (
    account_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (account_id, subsidiary_id)
);

CREATE TABLE Accounting_books (
    accounting_book_extid VARCHAR(255),
    accounting_book_id NUMERIC(39, 0) PRIMARY KEY,
    accounting_book_name VARCHAR(31),
    base_book_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    effective_period_id NUMERIC(39, 0),
    form_template_component_id VARCHAR(16),
    form_template_id NUMERIC(39, 0),
    is_adjustment_only VARCHAR(3),
    is_arrangement_level_reclass VARCHAR(3),
    is_consolidated VARCHAR(3),
    is_contingent_revenue_handling VARCHAR(3),
    is_include_child_subsidiaries VARCHAR(3),
    is_primary VARCHAR(3),
    is_two_step_revenue_allocation VARCHAR(3),
    status VARCHAR(128),
    unbilled_receivable_grouping VARCHAR(60)
);

CREATE TABLE Accounting_periods (
    accounting_period_id NUMERIC(39, 0) PRIMARY KEY,
    closed VARCHAR(3),
    closed_accounts_payable VARCHAR(3),
    closed_accounts_receivable VARCHAR(3),
    closed_all VARCHAR(3),
    closed_on TIMESTAMP,
    closed_payroll VARCHAR(3),
    date_last_modified TIMESTAMP,
    ending TIMESTAMP,
    fiscal_calendar_id NUMERIC(39, 0),
    full_name VARCHAR(597),
    is_adjustment VARCHAR(3),
    isinactive VARCHAR(3),
    locked_accounts_payable VARCHAR(3),
    locked_accounts_receivable VARCHAR(3),
    locked_all VARCHAR(3),
    locked_payroll VARCHAR(3),
    name VARCHAR(64),
    parent_id NUMERIC(39, 0),
    quarter VARCHAR(3),
    starting TIMESTAMP,
    year_0 VARCHAR(3),
    year_id NUMERIC(39, 0)
);

CREATE TABLE Activities (
    access_level VARCHAR(10),
    activity_id NUMERIC(39, 0),
    assigned_to_id NUMERIC(39, 0),
    case_id NUMERIC(39, 0),
    contact_id NUMERIC(39, 0),
    date_0 TIMESTAMP,
    date_completed TIMESTAMP,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    entity_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    opportunity_id NUMERIC(39, 0),
    owner_id NUMERIC(39, 0),
    status VARCHAR(12),
    title VARCHAR(457),
    type_0 VARCHAR(8)
);

CREATE TABLE Address_book (
    address VARCHAR(999),
    address_book_id NUMERIC(39, 0) PRIMARY KEY,
    address_id NUMERIC(39, 0),
    address_line_1 VARCHAR(150),
    address_line_2 VARCHAR(150),
    address_line_3 VARCHAR(150),
    attention VARCHAR(150),
    city VARCHAR(50),
    company VARCHAR(100),
    country VARCHAR(50),
    date_last_modified TIMESTAMP,
    entity_id NUMERIC(39, 0),
    is_default_bill_address VARCHAR(3),
    is_default_ship_address VARCHAR(3),
    is_inactive VARCHAR(3),
    name VARCHAR(150),
    phone VARCHAR(100),
    state VARCHAR(50),
    zip VARCHAR(36)
);

CREATE TABLE Addresses (
    address VARCHAR(999),
    address_id NUMERIC(39, 0) PRIMARY KEY,
    address_line_1 VARCHAR(150),
    address_line_2 VARCHAR(150),
    address_line_3 VARCHAR(150),
    attention VARCHAR(150),
    city VARCHAR(50),
    company VARCHAR(100),
    country VARCHAR(50),
    date_last_modified TIMESTAMP,
    is_overridden VARCHAR(3),
    phone VARCHAR(100),
    state VARCHAR(50),
    zip VARCHAR(36)
);

CREATE TABLE Amortization_sched_lines (
    account_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    amount VARCHAR(42),
    is_recognized VARCHAR(3),
    journal_id NUMERIC(39, 0),
    schedule_id NUMERIC(39, 0),
    PRIMARY KEY (account_id, accounting_period_id, journal_id, schedule_id)
);

CREATE TABLE Amortization_schedules (
    amount NUMERIC(20, 2),
    initial_amount VARCHAR(42),
    is_template VARCHAR(1),
    name VARCHAR(40),
    period_offset NUMERIC(10, 0),
    residual VARCHAR(42),
    schedule_id NUMERIC(39, 0) PRIMARY KEY,
    schedule_method VARCHAR(56),
    schedule_number VARCHAR(99),
    schedule_type VARCHAR(8),
    start_offset NUMERIC(39, 0),
    term_source VARCHAR(16)
);

CREATE TABLE Bill_of_distributions (
    bill_of_distribution_extid VARCHAR(255),
    bill_of_distribution_id NUMERIC(39, 0) PRIMARY KEY,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    distribution_category_id NUMERIC(39, 0),
    distribution_network_id NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    location_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Bill_of_materials (
    available_for_all_assemblies VARCHAR(3),
    available_for_all_locations VARCHAR(3),
    bill_of_materials_extid VARCHAR(255),
    bill_of_materials_id NUMERIC(39, 0) PRIMARY KEY,
    date_created TIMESTAMP,
    exclude_child_subsidiaries VARCHAR(3),
    form_template_component_id VARCHAR(16),
    form_template_id NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    memo VARCHAR(1024),
    name VARCHAR(600),
    original_assembly_id NUMERIC(39, 0),
    use_component_yield VARCHAR(3)
);

CREATE TABLE Billing_class_rates (
    billing_class_id NUMERIC(39, 0),
    billing_rate_card_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    unit_price NUMERIC(20, 2),
    PRIMARY KEY (billing_class_id, billing_rate_card_id, currency_id)
);

CREATE TABLE Billing_classes (
    billing_class_extid VARCHAR(255),
    billing_class_id NUMERIC(39, 0) PRIMARY KEY,
    description VARCHAR(999),
    is_inactive VARCHAR(3),
    name VARCHAR(40),
    sale_unit_id NUMERIC(39, 0),
    units_type_id NUMERIC(39, 0)
);

CREATE TABLE Billing_rate_cards_prices (
    billing_class_id NUMERIC(39, 0),
    billing_rate_card_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    sale_unit_id NUMERIC(39, 0),
    service_item_id NUMERIC(39, 0),
    unit_price NUMERIC(39, 0),
    units_type_id NUMERIC(39, 0),
    version_0 NUMERIC(39, 0),
    PRIMARY KEY (billing_class_id, billing_rate_card_id, currency_id, version_0)
);

CREATE TABLE Billing_rate_cards_versions (
    billing_rate_card_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_effective TIMESTAMP,
    date_last_modified TIMESTAMP,
    last_modified_by_id NUMERIC(39, 0),
    version_0 NUMERIC(39, 0),
    PRIMARY KEY (billing_rate_card_id, version_0)
);

CREATE TABLE Billing_schedule_descriptions (
    billing_schedule_id NUMERIC(39, 0) PRIMARY KEY,
    billing_schedule_type VARCHAR(20),
    frequency VARCHAR(20),
    name VARCHAR(40),
    recurrence_count NUMERIC(39, 0)
);

CREATE TABLE Billing_subscription_lines (
    billing_mode_id VARCHAR(32),
    catalog_type VARCHAR(10),
    date_created TIMESTAMP,
    date_end TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_recurrence_start TIMESTAMP,
    date_start TIMESTAMP,
    date_termination TIMESTAMP,
    discount NUMERIC(18, 8),
    is_discount_percentage VARCHAR(3),
    is_include_in_renewal VARCHAR(3),
    is_prorate_end_date VARCHAR(3),
    is_prorate_start_date VARCHAR(3),
    item_id NUMERIC(39, 0),
    line_type VARCHAR(50),
    period_amount NUMERIC(20, 2),
    price_interval_group_id NUMERIC(39, 0),
    purchase_order_id NUMERIC(39, 0),
    quantity NUMERIC(18, 8),
    recurring_amount NUMERIC(20, 2),
    sales_order_id NUMERIC(39, 0),
    sales_order_line_number NUMERIC(39, 0),
    status_id VARCHAR(25),
    subline_extid VARCHAR(255),
    subline_id NUMERIC(39, 0) PRIMARY KEY,
    subline_number NUMERIC(39, 0),
    subscription_id NUMERIC(39, 0),
    subscription_plan_line_id NUMERIC(39, 0),
    usage_multiplier_line_id NUMERIC(39, 0)
);

CREATE TABLE Billing_subscriptions (
    advance_renewal_period_number NUMERIC(39, 0),
    advance_renewal_period_unit_id VARCHAR(10),
    amount NUMERIC(35, 15),
    billing_account_id NUMERIC(39, 0),
    currency VARCHAR(4),
    date_created TIMESTAMP,
    date_end TIMESTAMP,
    date_estimated_revrec_end TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_start TIMESTAMP,
    default_renewal_method_id VARCHAR(30),
    default_renewal_plan_id NUMERIC(39, 0),
    default_renewal_price_book_id NUMERIC(39, 0),
    default_renewal_term_id NUMERIC(39, 0),
    default_renewal_trantype_id VARCHAR(8),
    description VARCHAR(400),
    generate_modification_elements VARCHAR(3),
    initial_term_id NUMERIC(39, 0),
    is_auto_renewal VARCHAR(3),
    is_sub_start_date_as_rsd VARCHAR(3),
    name VARCHAR(220),
    plan_id NUMERIC(39, 0),
    price_book_id NUMERIC(39, 0),
    sales_order_id NUMERIC(39, 0),
    subscription_extid VARCHAR(255),
    subscription_id NUMERIC(39, 0) PRIMARY KEY,
    subscription_number VARCHAR(220),
    subscription_revision NUMERIC(39, 0)
);

CREATE TABLE Billing_accounts (
    address_book_id NUMERIC(39, 0),
    bill_to_address_book_id NUMERIC(39, 0),
    billing_account_extid VARCHAR(255),
    billing_account_id NUMERIC(39, 0) PRIMARY KEY,
    billing_account_memo VARCHAR(400),
    billing_account_name VARCHAR(60),
    billing_account_number VARCHAR(60),
    billing_schedule_id NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    customer_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_actual_bill TIMESTAMP,
    date_last_bill_cycle TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_next_bill_cycle TIMESTAMP,
    date_start TIMESTAMP,
    department_id NUMERIC(39, 0),
    has_off_cycle_bill_request VARCHAR(3),
    is_customer_default VARCHAR(3),
    is_inactive VARCHAR(3),
    location_id NUMERIC(39, 0),
    ship_to_address_book_id NUMERIC(39, 0)
);

CREATE TABLE Billing_rate_cards (
    billing_rate_card_extid VARCHAR(255),
    billing_rate_card_id NUMERIC(39, 0) PRIMARY KEY,
    customer_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    is_inactive VARCHAR(3),
    name VARCHAR(100)
);

CREATE TABLE Billing_schedule (
    bill_amount NUMERIC(20, 2),
    bill_amount_foreign NUMERIC(20, 2),
    bill_count NUMERIC(15, 5),
    bill_date TIMESTAMP,
    bill_net_amount NUMERIC(39, 0),
    bill_net_amount_foreign NUMERIC(39, 0),
    milestone_id NUMERIC(39, 0),
    payment_terms_id NUMERIC(39, 0),
    rev_rec_end_date TIMESTAMP,
    rev_rec_start_date TIMESTAMP,
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0)
);

CREATE TABLE Bins (
    bin_id NUMERIC(39, 0) PRIMARY KEY,
    bin_number VARCHAR(100),
    external_id VARCHAR(255),
    is_inactive VARCHAR(1),
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000)
);

CREATE TABLE Bin_number (
    bin_id NUMERIC(39, 0),
    bin_number VARCHAR(100),
    bin_number_extid VARCHAR(255),
    isinactive VARCHAR(3),
    ispreferred VARCHAR(3),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    on_hand_count NUMERIC(39, 0)
);

CREATE TABLE Bin_number_counts (
    available_count NUMERIC(39, 0),
    bin_id NUMERIC(39, 0),
    bin_number VARCHAR(100),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    on_hand_count NUMERIC(39, 0)
);

CREATE TABLE Bom_revision_components (
    bom_revision_component_id NUMERIC(39, 0) PRIMARY KEY,
    bom_revision_id NUMERIC(39, 0),
    component_yield NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    item_source VARCHAR(30),
    quantity NUMERIC(18, 8),
    seq_num NUMERIC(39, 0),
    unit_of_measure_id NUMERIC(39, 0)
);

CREATE TABLE Bom_revisions (
    bill_of_materials_id NUMERIC(39, 0),
    bom_revision_extid VARCHAR(255),
    bom_revision_id NUMERIC(39, 0) PRIMARY KEY,
    date_created TIMESTAMP,
    date_effective TIMESTAMP,
    date_obsolete TIMESTAMP,
    form_template_component_id VARCHAR(16),
    form_template_id NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    memo VARCHAR(1024),
    name VARCHAR(128)
);

CREATE TABLE Budget (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    amount NUMERIC(20, 2),
    budget_date TIMESTAMP,
    budget_id NUMERIC(39, 0) PRIMARY KEY,
    category_id NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    customer_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Budget_category (
    budget_category_id NUMERIC(39, 0) PRIMARY KEY,
    is_global VARCHAR(3),
    isinactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Events1 (
    access_level VARCHAR(10),
    company_id NUMERIC(39, 0),
    contact_id NUMERIC(39, 0),
    date_0 TIMESTAMP,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    event_extid VARCHAR(255),
    event_id NUMERIC(39, 0),
    is_timed_event VARCHAR(3),
    location_0 VARCHAR(200),
    message VARCHAR(4000),
    opportunity_id NUMERIC(39, 0),
    organizer_id NUMERIC(39, 0),
    status VARCHAR(64),
    supportcase_id NUMERIC(39, 0),
    title VARCHAR(256)
);

CREATE TABLE Calls (
    call_date TIMESTAMP,
    call_extid VARCHAR(255),
    call_id NUMERIC(39, 0),
    case_id NUMERIC(39, 0),
    company_id NUMERIC(39, 0),
    contact_id NUMERIC(39, 0),
    date_completed TIMESTAMP,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    note VARCHAR(4000),
    opportunity_id NUMERIC(39, 0),
    organizer_id NUMERIC(39, 0),
    owner_id NUMERIC(39, 0),
    phone VARCHAR(99),
    status VARCHAR(64),
    subject VARCHAR(256)
);

CREATE TABLE Campaigns (
    audience_id NUMERIC(39, 0),
    campaign_extid VARCHAR(255),
    campaign_id NUMERIC(39, 0) PRIMARY KEY,
    category_id NUMERIC(39, 0),
    cost_0 NUMERIC(20, 2),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    end_date TIMESTAMP,
    expectedrevenue NUMERIC(20, 2),
    family_id NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    is_sales_campaign VARCHAR(3),
    keyword VARCHAR(99),
    last_modified_date TIMESTAMP,
    message VARCHAR(4000),
    number_0 VARCHAR(99),
    offer_id NUMERIC(39, 0),
    organizer_id NUMERIC(39, 0),
    search_engine_id NUMERIC(39, 0),
    start_date TIMESTAMP,
    time_zone_0 VARCHAR(30),
    title VARCHAR(256),
    url VARCHAR(255),
    vertical_id NUMERIC(39, 0)
);

CREATE TABLE Campaign_categories (
    campaigncategory_extid VARCHAR(255),
    campaigncategory_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    default_campaign_id NUMERIC(39, 0),
    description VARCHAR(1499),
    is_available_externally VARCHAR(3),
    isinactive VARCHAR(3),
    name VARCHAR(120),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Campaign_families (
    campaignfamily_extid VARCHAR(255),
    campaignfamily_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(499),
    isinactive VARCHAR(3),
    name VARCHAR(40)
);

CREATE TABLE Campaign_subscription_statuses (
    date_last_modified TIMESTAMP,
    entity_id NUMERIC(39, 0),
    last_modified_date TIMESTAMP,
    subscription_id NUMERIC(39, 0),
    unsubscribed VARCHAR(3),
    PRIMARY KEY (entity_id, subscription_id)
);

CREATE TABLE Campaign_audiences (
    campaignaudience_extid VARCHAR(255),
    campaignaudience_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(499),
    isinactive VARCHAR(3),
    name VARCHAR(40)
);

CREATE TABLE Campaignchannel (
    campaign_channel_extid VARCHAR(255),
    campaign_channel_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    event_type_id VARCHAR(19),
    is_inactive VARCHAR(3),
    name VARCHAR(59)
);

CREATE TABLE Campaignevent (
    campaign_event_extid VARCHAR(255),
    campaign_event_id NUMERIC(39, 0) PRIMARY KEY,
    campaign_id NUMERIC(39, 0),
    channel_id NUMERIC(39, 0),
    cost_0 NUMERIC(20, 2),
    date_scheduled TIMESTAMP,
    date_sent TIMESTAMP,
    group_id NUMERIC(39, 0),
    number_clicked_thru NUMERIC(39, 0),
    number_received NUMERIC(39, 0),
    number_responded NUMERIC(39, 0),
    number_sent NUMERIC(39, 0),
    number_unsubscribed NUMERIC(39, 0),
    promotion_code_id NUMERIC(39, 0),
    status_id VARCHAR(12),
    subscription_id NUMERIC(39, 0),
    template_id NUMERIC(39, 0),
    test_cell_id NUMERIC(39, 0)
);

CREATE TABLE Campaignitem (
    campaign_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0)
);

CREATE TABLE Campaignoffer (
    campaign_offer_extid VARCHAR(255),
    campaign_offer_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    is_inactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Campaignresponse (
    campaign_event_id NUMERIC(39, 0),
    campaign_response_extid VARCHAR(255),
    campaign_response_id NUMERIC(39, 0) PRIMARY KEY,
    contact_id NUMERIC(39, 0),
    date_sent TIMESTAMP,
    entity_id NUMERIC(39, 0),
    response_id VARCHAR(30)
);

CREATE TABLE Campaignresponsehistory (
    author NUMERIC(39, 0),
    campaign_response_id NUMERIC(39, 0),
    date_0 TIMESTAMP,
    note VARCHAR(4000),
    response_id VARCHAR(30),
    status_detail VARCHAR(4000),
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Campaign_search_engine (
    date_last_modified TIMESTAMP,
    description VARCHAR(499),
    isinactive VARCHAR(3),
    name VARCHAR(40),
    search_engine_extid VARCHAR(255),
    search_engine_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Campaign_subscriptions (
    campaignsubscription_extid VARCHAR(255),
    campaignsubscription_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(499),
    isinactive VARCHAR(3),
    name VARCHAR(100)
);

CREATE TABLE Campaign_verticals (
    campaignvertical_extid VARCHAR(255),
    campaignvertical_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(499),
    isinactive VARCHAR(3),
    name VARCHAR(40)
);

CREATE TABLE Case_origins (
    case_origin_extid VARCHAR(255),
    case_origin_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified_ TIMESTAMP,
    description VARCHAR(200),
    isinactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Case_stage_changes (
    case_id NUMERIC(39, 0),
    casestage VARCHAR(12),
    start_date TIMESTAMP
);

CREATE TABLE Case_types (
    case_type_extid VARCHAR(255),
    case_type_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(200),
    isinactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Caseescalationhistory (
    case_id NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    escalation_action VARCHAR(10),
    escalation_date TIMESTAMP,
    escalator_id NUMERIC(39, 0),
    message VARCHAR(4000)
);

CREATE TABLE Caseissue (
    case_issue_extid VARCHAR(255),
    case_issue_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(200),
    is_inactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Caseorigin (
    case_origin_extid VARCHAR(255),
    case_origin_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(200),
    is_inactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Casetype (
    case_type NUMERIC(39, 0) PRIMARY KEY,
    case_type_extid VARCHAR(255),
    date_last_modified TIMESTAMP,
    description VARCHAR(200),
    is_inactive VARCHAR(3),
    name VARCHAR(50)
);

CREATE TABLE Charges (
    amount NUMERIC(20, 2),
    billing_account_id NUMERIC(39, 0),
    billing_mode_id VARCHAR(32),
    billing_schedule_id NUMERIC(39, 0),
    category_0 NUMERIC(39, 0),
    charge_extid VARCHAR(255),
    charge_id NUMERIC(39, 0),
    chargeemployee NUMERIC(39, 0),
    chargerule NUMERIC(39, 0),
    chargestage VARCHAR(32),
    chargetype NUMERIC(39, 0),
    chargeuse VARCHAR(32),
    class_0 NUMERIC(39, 0),
    currency NUMERIC(39, 0),
    customer NUMERIC(39, 0),
    date_0 TIMESTAMP,
    date_bill TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_service_end TIMESTAMP,
    date_service_start TIMESTAMP,
    department NUMERIC(39, 0),
    description VARCHAR(4000),
    group_order NUMERIC(39, 0),
    item NUMERIC(39, 0),
    location_0 NUMERIC(39, 0),
    memo VARCHAR(4000),
    quantity NUMERIC(18, 8),
    rate NUMERIC(30, 15),
    run_id NUMERIC(39, 0),
    sales_order NUMERIC(39, 0),
    so_line NUMERIC(39, 0),
    subscription_line_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    time_source NUMERIC(39, 0),
    unit_id NUMERIC(39, 0)
);

CREATE TABLE Classes (
    class_extid VARCHAR(255),
    class_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    full_name VARCHAR(4000),
    is_including_child_subs VARCHAR(3),
    isinactive VARCHAR(3),
    name VARCHAR(31),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Commission_authorization_link (
    authorized_amount NUMERIC(39, 0),
    calc_type VARCHAR(11),
    commission_transaction_id NUMERIC(39, 0),
    commission_transaction_line_id NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    schedule_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Commissionplan (
    commission_plan VARCHAR(60),
    commission_plan_id NUMERIC(39, 0) PRIMARY KEY,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_modified TIMESTAMP,
    description VARCHAR(200),
    is_inactive VARCHAR(3)
);

CREATE TABLE Commissionrate (
    commisssion_schedule_id NUMERIC(39, 0),
    rate NUMERIC(39, 0)
);

CREATE TABLE Commissionschedule (
    author NUMERIC(39, 0),
    category_0 VARCHAR(10),
    date_created TIMESTAMP,
    description VARCHAR(199),
    is_inactive VARCHAR(3),
    manager_ VARCHAR(1),
    name VARCHAR(50),
    period_type VARCHAR(10),
    schedule_id NUMERIC(39, 0) PRIMARY KEY,
    target_amount NUMERIC(39, 0),
    type_id VARCHAR(10)
);

CREATE TABLE Companies (
    address VARCHAR(999),
    address1 VARCHAR(150),
    address2 VARCHAR(150),
    address3 VARCHAR(150),
    city VARCHAR(50),
    comments VARCHAR(4000),
    company_extid VARCHAR(255),
    company_id NUMERIC(39, 0),
    companyname VARCHAR(83),
    country VARCHAR(50),
    create_date TIMESTAMP,
    currency_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    email VARCHAR(254),
    full_name VARCHAR(1800),
    isinactive VARCHAR(3),
    last_modified_date TIMESTAMP,
    loginaccess VARCHAR(3),
    name VARCHAR(83),
    parent_id NUMERIC(39, 0),
    phone VARCHAR(100),
    state VARCHAR(50),
    subsidiary NUMERIC(39, 0),
    url VARCHAR(100),
    zipcode VARCHAR(36)
);

CREATE TABLE Company_status (
    company_status_extid VARCHAR(255),
    company_status_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    isinactive VARCHAR(3),
    name VARCHAR(199),
    probability NUMERIC(6, 2),
    readonly VARCHAR(3)
);

CREATE TABLE Companycontactmap (
    company_id NUMERIC(39, 0),
    contact_id NUMERIC(39, 0),
    contactrole_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    PRIMARY KEY (company_id, contact_id)
);

CREATE TABLE Competitor (
    competitor_extid VARCHAR(255),
    competitor_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    description VARCHAR(1999),
    is_inactive VARCHAR(3),
    name VARCHAR(50),
    products_services VARCHAR(65534),
    strategy VARCHAR(65534),
    strengths VARCHAR(65534),
    url VARCHAR(100),
    weaknesses VARCHAR(65534)
);

CREATE TABLE Competitoroppmap (
    competitor_id NUMERIC(39, 0),
    is_winner VARCHAR(3),
    notes VARCHAR(999),
    opportunity_id NUMERIC(39, 0)
);

CREATE TABLE Components_per_routing_steps (
    component_id NUMERIC(39, 0),
    mfg_routing_id NUMERIC(39, 0),
    sequence_id NUMERIC(39, 0),
    sequence_number NUMERIC(39, 0)
);

CREATE TABLE Consolidated_exchange_rates (
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    average_budget_rate NUMERIC(30, 15),
    average_rate NUMERIC(30, 15),
    consolidated_exchange_rate_id NUMERIC(39, 0) PRIMARY KEY,
    current_budget_rate NUMERIC(30, 15),
    current_rate NUMERIC(30, 15),
    from_subsidiary_id NUMERIC(39, 0),
    historical_budget_rate NUMERIC(30, 15),
    historical_rate NUMERIC(30, 15),
    to_subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Contacts (
    address VARCHAR(999),
    altemail VARCHAR(254),
    assistant_id NUMERIC(39, 0),
    assistantphone VARCHAR(100),
    city VARCHAR(50),
    comments VARCHAR(4000),
    company_id NUMERIC(39, 0),
    contact_extid VARCHAR(255),
    contact_id NUMERIC(39, 0) PRIMARY KEY,
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    email VARCHAR(254),
    fax VARCHAR(100),
    firstname VARCHAR(32),
    full_name VARCHAR(1800),
    homephone VARCHAR(100),
    is_private VARCHAR(3),
    isemailhtml VARCHAR(3),
    isemailpdf VARCHAR(3),
    isinactive VARCHAR(3),
    last_modified_date TIMESTAMP,
    lastname VARCHAR(32),
    line1 VARCHAR(150),
    line2 VARCHAR(150),
    line3 VARCHAR(150),
    loginaccess VARCHAR(3),
    middlename VARCHAR(32),
    mobilephone VARCHAR(100),
    name VARCHAR(83),
    officephone VARCHAR(100),
    phone VARCHAR(100),
    salutation VARCHAR(30),
    state VARCHAR(50),
    subsidiary NUMERIC(39, 0),
    supervisior_id NUMERIC(39, 0),
    supervisorphone VARCHAR(100),
    title VARCHAR(99),
    zipcode VARCHAR(36)
);

CREATE TABLE Contact_types (
    contact_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    isinactive VARCHAR(3),
    name VARCHAR(31),
    owner_id NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    shared_0 VARCHAR(3)
);

CREATE TABLE Contactrole (
    contactrole_extid VARCHAR(255),
    contactrole_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    is_inactive VARCHAR(3),
    name VARCHAR(31)
);

CREATE TABLE Countries (
    country_id NUMERIC(39, 0) PRIMARY KEY,
    name VARCHAR(50),
    short_name VARCHAR(2)
);

CREATE TABLE Coupon_codes (
    code VARCHAR(120),
    coupon_code_id NUMERIC(39, 0) PRIMARY KEY,
    date_sent TIMESTAMP,
    promotion_code_id NUMERIC(39, 0),
    recipient_id NUMERIC(39, 0)
);

CREATE TABLE Crmgroup (
    group_id NUMERIC(39, 0) PRIMARY KEY,
    group_type VARCHAR(12),
    is_mfg_work_center VARCHAR(3),
    is_private VARCHAR(3),
    is_sales_group VARCHAR(3),
    is_support_group VARCHAR(3),
    labor_resources NUMERIC(39, 0),
    machine_resources NUMERIC(39, 0),
    owner NUMERIC(39, 0),
    title VARCHAR(51),
    work_calendar_id NUMERIC(39, 0)
);

CREATE TABLE Crmgroupmap (
    entity_id NUMERIC(39, 0),
    group_id NUMERIC(39, 0),
    is_primary VARCHAR(3)
);

CREATE TABLE Crmtemplate (
    crmtemplate_id NUMERIC(39, 0) PRIMARY KEY,
    crmtemplate_modified_by NUMERIC(39, 0),
    crmtemplate_record_type VARCHAR(11),
    date_last_modified TIMESTAMP,
    description VARCHAR(1000),
    from_email VARCHAR(99),
    is_inactive VARCHAR(3),
    is_private VARCHAR(3),
    name VARCHAR(128),
    owner_id NUMERIC(39, 0),
    reply_email_address VARCHAR(99),
    subject VARCHAR(199)
);

CREATE TABLE Currencies (
    currency_extid VARCHAR(255),
    currency_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    is_inactive VARCHAR(3),
    name VARCHAR(105),
    precision_0 NUMERIC(1, 0),
    symbol VARCHAR(4)
);

CREATE TABLE Currency_exchange_rate_types (
    currency_rate_type_extid VARCHAR(255),
    currency_rate_type_id NUMERIC(39, 0) PRIMARY KEY,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(2000),
    is_default VARCHAR(3),
    is_inactive VARCHAR(3),
    name VARCHAR(200)
);

CREATE TABLE Currency_exchange_rates (
    anchor_currency_id NUMERIC(39, 0),
    base_currency_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    currency_rate_id NUMERIC(39, 0) PRIMARY KEY,
    currency_rate_provider_id VARCHAR(8),
    currency_rate_type_id NUMERIC(39, 0),
    date_effective TIMESTAMP,
    date_last_modified TIMESTAMP,
    entity_id NUMERIC(39, 0),
    exchange_rate NUMERIC(30, 15),
    is_anchor_only VARCHAR(3),
    update_method_id VARCHAR(8)
);

CREATE TABLE Currencyrates (
    anchor_currency_id NUMERIC(39, 0),
    base_currency_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    currencyrate_id NUMERIC(39, 0) PRIMARY KEY,
    currencyrate_provider_id VARCHAR(8),
    date_effective TIMESTAMP,
    date_last_modified TIMESTAMP,
    entity_id NUMERIC(39, 0),
    exchange_rate NUMERIC(30, 15),
    is_anchor_only VARCHAR(3),
    update_method_id VARCHAR(8)
);

CREATE TABLE Customers (
    accountnumber VARCHAR(99),
    alcohol_recipient_type VARCHAR(32),
    allow_task_time_for_allocation VARCHAR(3),
    altemail VARCHAR(254),
    alternate_contact_id NUMERIC(39, 0),
    altphone VARCHAR(100),
    amount_complete NUMERIC(5, 2),
    billaddress VARCHAR(999),
    billing_rate_card_id NUMERIC(39, 0),
    billing_schedule_id NUMERIC(39, 0),
    billing_schedule_type VARCHAR(60),
    billing_transaction_type VARCHAR(192),
    calculated_end TIMESTAMP,
    category_0 VARCHAR(30),
    city VARCHAR(50),
    comments VARCHAR(4000),
    companyname VARCHAR(83),
    consol_days_overdue NUMERIC(39, 0),
    consol_deposit_balance NUMERIC(39, 0),
    consol_deposit_balance_foreign NUMERIC(39, 0),
    consol_openbalance NUMERIC(39, 0),
    consol_openbalance_foreign NUMERIC(39, 0),
    consol_unbilled_orders NUMERIC(39, 0),
    consol_unbilled_orders_foreign NUMERIC(39, 0),
    converted_to_contact_id NUMERIC(39, 0),
    converted_to_id NUMERIC(39, 0),
    cost_estimate NUMERIC(25, 5),
    country VARCHAR(50),
    create_date TIMESTAMP,
    credithold VARCHAR(4),
    creditlimit NUMERIC(20, 2),
    currency_id NUMERIC(39, 0),
    customer_extid VARCHAR(255),
    customer_id NUMERIC(39, 0) PRIMARY KEY,
    customer_type_id NUMERIC(39, 0),
    date_calculated_start TIMESTAMP,
    date_closed TIMESTAMP,
    date_convsersion TIMESTAMP,
    date_first_order TIMESTAMP,
    date_first_sale TIMESTAMP,
    date_gross_lead TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_last_order TIMESTAMP,
    date_last_sale TIMESTAMP,
    date_lead TIMESTAMP,
    date_prospect TIMESTAMP,
    date_scheduled_end TIMESTAMP,
    days_overdue NUMERIC(39, 0),
    default_order_priority NUMERIC(20, 2),
    default_receivables_account_id NUMERIC(39, 0),
    deposit_balance NUMERIC(20, 2),
    deposit_balance_foreign NUMERIC(39, 0),
    email VARCHAR(254),
    expected_close TIMESTAMP,
    fax VARCHAR(100),
    first_sale_period_id NUMERIC(39, 0),
    first_visit TIMESTAMP,
    firstname VARCHAR(32),
    forecast_based_on_allocations VARCHAR(3),
    forecast_charge_run_on_demand VARCHAR(3),
    full_name VARCHAR(1800),
    home_phone VARCHAR(100),
    is_exempt_time VARCHAR(3),
    is_explicit_conversion VARCHAR(3),
    is_job VARCHAR(3),
    is_limit_time_to_assignees VARCHAR(3),
    is_person VARCHAR(3),
    is_productive_time VARCHAR(3),
    is_project_completely_billed VARCHAR(3),
    is_source_item_from_brc VARCHAR(3),
    is_utilized_time VARCHAR(3),
    isemailhtml VARCHAR(3),
    isemailpdf VARCHAR(3),
    isinactive VARCHAR(3),
    istaxable VARCHAR(3),
    job_end TIMESTAMP,
    job_start TIMESTAMP,
    job_type_id NUMERIC(39, 0),
    labor_budget_from_allocations VARCHAR(3),
    language_id VARCHAR(30),
    last_modified_date TIMESTAMP,
    last_sale_period_id NUMERIC(39, 0),
    last_visit TIMESTAMP,
    lastname VARCHAR(32),
    lead_source_id NUMERIC(39, 0),
    line1 VARCHAR(150),
    line2 VARCHAR(150),
    line3 VARCHAR(150),
    loginaccess VARCHAR(3),
    middlename VARCHAR(32),
    mobile_phone VARCHAR(100),
    multiple_price_id NUMERIC(39, 0),
    name VARCHAR(83),
    openbalance NUMERIC(39, 0),
    openbalance_foreign NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    partner_id NUMERIC(39, 0),
    payment_terms_id NUMERIC(39, 0),
    phone VARCHAR(100),
    primary_contact_id NUMERIC(39, 0),
    print_on_check_as VARCHAR(83),
    probability NUMERIC(6, 2),
    project_expense_type_id NUMERIC(39, 0),
    project_manager_id NUMERIC(39, 0),
    projected_end TIMESTAMP,
    referrer VARCHAR(4000),
    reminderdays NUMERIC(39, 0),
    renewal TIMESTAMP,
    represents_subsidiary_id NUMERIC(39, 0),
    resalenumber VARCHAR(20),
    rev_rec_forecast_rule_id NUMERIC(39, 0),
    rev_rec_forecast_template NUMERIC(39, 0),
    revenue_estimate NUMERIC(25, 5),
    sales_rep_id NUMERIC(39, 0),
    sales_territory_id NUMERIC(39, 0),
    salutation VARCHAR(30),
    scheduling_method_id VARCHAR(15),
    ship_complete VARCHAR(3),
    shipaddress VARCHAR(999),
    state VARCHAR(50),
    status VARCHAR(199),
    status_descr VARCHAR(199),
    status_probability NUMERIC(6, 2),
    status_read_only VARCHAR(3),
    subsidiary_id NUMERIC(39, 0),
    tax_item_id NUMERIC(39, 0),
    third_party_acct VARCHAR(32),
    third_party_carrier VARCHAR(64),
    third_party_country VARCHAR(6),
    third_party_zip_code VARCHAR(10),
    time_approval_type_id NUMERIC(39, 0),
    top_level_parent_id NUMERIC(39, 0),
    unbilled_orders NUMERIC(20, 2),
    unbilled_orders_foreign NUMERIC(39, 0),
    url VARCHAR(100),
    use_calculated_billing_budget VARCHAR(3),
    use_calculated_cost_budget VARCHAR(3),
    use_percent_complete_override VARCHAR(3),
    vat_reg_number VARCHAR(20),
    web_lead VARCHAR(3),
    zipcode VARCHAR(36)
);

CREATE TABLE Customer_currencies (
    currency_id NUMERIC(39, 0),
    customer_id NUMERIC(39, 0),
    deposit_balance_foreign NUMERIC(39, 0),
    openbalance_foreign NUMERIC(39, 0),
    unbilled_orders_foreign NUMERIC(39, 0),
    PRIMARY KEY (currency_id, customer_id)
);

CREATE TABLE Customer_group_pricing (
    customer_id NUMERIC(39, 0),
    price_type_id NUMERIC(39, 0),
    pricing_group_id NUMERIC(39, 0),
    PRIMARY KEY (customer_id, pricing_group_id)
);

CREATE TABLE Customer_item_pricing (
    currency_id NUMERIC(39, 0),
    customer_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    item_unit_price NUMERIC(30, 15),
    price_type_id NUMERIC(39, 0)
);

CREATE TABLE Customer_partner_sales_teams (
    contribution NUMERIC(39, 0),
    customer_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    isprimary VARCHAR(3),
    partner_id NUMERIC(39, 0),
    sales_role_id NUMERIC(39, 0),
    PRIMARY KEY (customer_id, partner_id)
);

CREATE TABLE Customer_sales_teams (
    contribution NUMERIC(39, 0),
    customer_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    isprimary VARCHAR(3),
    sales_rep_id NUMERIC(39, 0),
    sales_role_id NUMERIC(39, 0),
    PRIMARY KEY (customer_id, sales_rep_id)
);

CREATE TABLE Customer_subsidiary_map (
    customer_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (customer_id, subsidiary_id)
);

CREATE TABLE Customer_types (
    customer_type_extid VARCHAR(255),
    customer_type_id NUMERIC(39, 0) PRIMARY KEY,
    date_last_modified TIMESTAMP,
    isinactive VARCHAR(3),
    name VARCHAR(31),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Deleted_records (
    custom_record_type VARCHAR(4000),
    date_deleted TIMESTAMP,
    entity_id NUMERIC(39, 0),
    entity_name VARCHAR(999),
    is_custom_list VARCHAR(1),
    name VARCHAR(999),
    record_base_type VARCHAR(30),
    record_id NUMERIC(39, 0),
    record_type_name VARCHAR(30)
);

CREATE TABLE Departments (
    date_last_modified TIMESTAMP,
    department_extid VARCHAR(255),
    department_id NUMERIC(39, 0) PRIMARY KEY,
    full_name VARCHAR(4000),
    is_including_child_subs VARCHAR(3),
    isinactive VARCHAR(3),
    name VARCHAR(31),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Distribution_categories (
    category_name VARCHAR(60),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    distribution_category_id NUMERIC(39, 0) PRIMARY KEY,
    is_inactive VARCHAR(3)
);

CREATE TABLE Distribution_networks (
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    distribution_network_extid VARCHAR(255),
    distribution_network_id NUMERIC(39, 0) PRIMARY KEY,
    is_inactive VARCHAR(3),
    memo VARCHAR(4000),
    network_name VARCHAR(100)
);

CREATE TABLE Employees (
    accountnumber VARCHAR(4000),
    address VARCHAR(999),
    approvallimit NUMERIC(20, 2),
    approver_id NUMERIC(39, 0),
    billing_class_id NUMERIC(39, 0),
    birthdate TIMESTAMP,
    city VARCHAR(50),
    class_id NUMERIC(39, 0),
    comments VARCHAR(4000),
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    def_acct_corp_card_expenses_id NUMERIC(39, 0),
    def_expense_report_currency_id NUMERIC(39, 0),
    default_job_resource_role_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    email VARCHAR(254),
    employee_extid VARCHAR(255),
    employee_id NUMERIC(39, 0) PRIMARY KEY,
    employee_type_id NUMERIC(39, 0),
    firstname VARCHAR(32),
    full_name VARCHAR(1800),
    gender VARCHAR(3),
    hireddate TIMESTAMP,
    home_phone VARCHAR(100),
    initials VARCHAR(3),
    is_in_payroll VARCHAR(3),
    is_job_manager VARCHAR(3),
    is_job_resource VARCHAR(3),
    isinactive VARCHAR(3),
    issalesrep VARCHAR(3),
    issupportrep VARCHAR(3),
    job_description VARCHAR(65534),
    jobtitle VARCHAR(100),
    labor_cost NUMERIC(39, 0),
    last_modified_date TIMESTAMP,
    lastname VARCHAR(32),
    lastreviewdate TIMESTAMP,
    line1 VARCHAR(150),
    line2 VARCHAR(150),
    line3 VARCHAR(150),
    location_id NUMERIC(39, 0),
    loginaccess VARCHAR(3),
    marital_status_id NUMERIC(39, 0),
    middlename VARCHAR(32),
    mobile_phone VARCHAR(100),
    name VARCHAR(83),
    nextreviewdate TIMESTAMP,
    office_phone VARCHAR(100),
    phone VARCHAR(100),
    releasedate TIMESTAMP,
    salutation VARCHAR(30),
    socialsecuritynumber VARCHAR(11),
    state VARCHAR(50),
    status VARCHAR(100),
    subsidiary_id NUMERIC(39, 0),
    supervisor_id NUMERIC(39, 0),
    target_utilization NUMERIC(12, 5),
    work_calendar_id NUMERIC(39, 0),
    zipcode VARCHAR(36)
);

CREATE TABLE Employee_currency_map (
    currency_id NUMERIC(39, 0),
    employee_id NUMERIC(39, 0),
    PRIMARY KEY (currency_id, employee_id)
);

CREATE TABLE Employee_time (
    approved VARCHAR(3),
    billable VARCHAR(3),
    billed VARCHAR(3),
    billing_class_id NUMERIC(39, 0),
    billing_subsidiary_id NUMERIC(39, 0),
    break_duration NUMERIC(12, 5),
    charge_billing_run_id NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    closed TIMESTAMP,
    comments VARCHAR(4000),
    customer_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    day_0 TIMESTAMP,
    department_id NUMERIC(39, 0),
    duration NUMERIC(12, 5),
    employee_id NUMERIC(39, 0),
    employee_time_id NUMERIC(39, 0) PRIMARY KEY,
    ending TIMESTAMP,
    event_id NUMERIC(39, 0),
    is_outside_project_plan VARCHAR(3),
    is_posted VARCHAR(3),
    is_productive VARCHAR(1),
    is_utilized VARCHAR(1),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    next_approver_id NUMERIC(39, 0),
    payroll_item_id NUMERIC(39, 0),
    payroll_workplace_id NUMERIC(39, 0),
    price_type_id NUMERIC(39, 0),
    rejection_note VARCHAR(4000),
    remaining_time_to_charge NUMERIC(39, 0),
    resource_allocation_id NUMERIC(39, 0),
    starting TIMESTAMP,
    status_code VARCHAR(200),
    subsidiary_id NUMERIC(39, 0),
    time_type VARCHAR(9),
    timesheet_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0),
    unit_cost NUMERIC(20, 2),
    unit_price NUMERIC(30, 15)
);

CREATE TABLE Employee_types (
    employee_type_id NUMERIC(39, 0) PRIMARY KEY,
    isinactive VARCHAR(3),
    name VARCHAR(99),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Entity (
    address_one VARCHAR(150),
    address_three VARCHAR(150),
    address_two VARCHAR(150),
    city VARCHAR(50),
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    email VARCHAR(254),
    entity_extid VARCHAR(255),
    entity_id NUMERIC(39, 0) PRIMARY KEY,
    entity_type VARCHAR(12),
    first_name VARCHAR(32),
    full_name VARCHAR(1800),
    global_subscription_status NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    is_online_bill_pay VARCHAR(3),
    is_unavailable VARCHAR(3),
    last_modified_date TIMESTAMP,
    last_name VARCHAR(32),
    login_access VARCHAR(3),
    middle_name VARCHAR(32),
    name VARCHAR(83),
    notes VARCHAR(4000),
    originator_id VARCHAR(40),
    parent_id NUMERIC(39, 0),
    phone VARCHAR(100),
    salutation VARCHAR(30),
    state VARCHAR(50),
    subsidiary NUMERIC(39, 0),
    unsubscribed VARCHAR(1),
    zipcode VARCHAR(36)
);

CREATE TABLE Entity_role_map (
    contact_id NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    role_id NUMERIC(39, 0)
);

CREATE TABLE Entity_status (
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    entity_status_extid VARCHAR(255),
    entity_status_id NUMERIC(39, 0) PRIMARY KEY,
    isinactive VARCHAR(3),
    name VARCHAR(199),
    probability NUMERIC(6, 2),
    read_only VARCHAR(3),
    type_0 VARCHAR(30)
);

CREATE TABLE Entity_status_history (
    comment_0 VARCHAR(199),
    date_0 TIMESTAMP,
    entity_id NUMERIC(39, 0),
    entity_status_new_id NUMERIC(39, 0),
    entity_status_old_id NUMERIC(39, 0)
);

CREATE TABLE Entitycategory (
    entity_category_id NUMERIC(39, 0),
    entity_type VARCHAR(12),
    is_inactive VARCHAR(1),
    name VARCHAR(99),
    parent_0 NUMERIC(39, 0),
    PRIMARY KEY (entity_category_id, entity_type)
);

CREATE TABLE Entityeventmap (
    attendee_status_id VARCHAR(12),
    entity_id NUMERIC(39, 0),
    event_id NUMERIC(39, 0),
    resource_id NUMERIC(39, 0),
    status_id VARCHAR(12)
);

CREATE TABLE Entityterritorymap (
    entity_id NUMERIC(39, 0),
    territory_id NUMERIC(39, 0)
);

CREATE TABLE Eventattendees (
    attendee_id NUMERIC(39, 0),
    event_id NUMERIC(39, 0),
    status VARCHAR(12)
);

CREATE TABLE Expense_accounts (
    account_number VARCHAR(60),
    comments VARCHAR(25),
    current_balance NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    desription VARCHAR(60),
    expense_account_extid VARCHAR(255),
    expense_account_id NUMERIC(39, 0) PRIMARY KEY,
    full_name VARCHAR(4000),
    is_including_child_subs VARCHAR(3),
    is_summary VARCHAR(3),
    isinactive VARCHAR(3),
    legal_name VARCHAR(400),
    name VARCHAR(93),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Expense_amortization_rules (
    amount_source VARCHAR(150),
    contra_account_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    end_date_change_impact VARCHAR(150),
    end_date_source VARCHAR(150),
    expense_rule_id NUMERIC(39, 0) PRIMARY KEY,
    initial_amount VARCHAR(42),
    name VARCHAR(99),
    period_offset NUMERIC(39, 0),
    recognition_period NUMERIC(39, 0),
    reforecast_method VARCHAR(150),
    residual VARCHAR(42),
    rule_method VARCHAR(150),
    start_date_source VARCHAR(150),
    start_offset NUMERIC(39, 0),
    term_in_days NUMERIC(39, 0),
    term_in_months NUMERIC(39, 0)
);

CREATE TABLE Expense_based_charge_rules (
    charge_rule_id NUMERIC(39, 0),
    charge_rule_type VARCHAR(32),
    charge_stage VARCHAR(32),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(4000),
    expense_amount_multiplier NUMERIC(12, 3),
    expense_based_charge_rule_id NUMERIC(39, 0),
    expense_saved_search NUMERIC(39, 0),
    external_id VARCHAR(255),
    form_template NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    rule_name VARCHAR(200),
    rule_order NUMERIC(39, 0)
);

CREATE TABLE Expense_categories (
    description VARCHAR(999),
    expense_account_id NUMERIC(39, 0),
    expense_category_extid VARCHAR(255),
    expense_category_id NUMERIC(39, 0) PRIMARY KEY,
    expense_item_id NUMERIC(39, 0),
    is_personal_corp_card_expense VARCHAR(3),
    isinactive VARCHAR(3),
    name VARCHAR(61),
    rate_required VARCHAR(3)
);

CREATE TABLE Expense_categories_rates (
    default_rate NUMERIC(30, 15),
    expense_category_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (expense_category_id, subsidiary_id)
);

CREATE TABLE Expense_categories_subs_map (
    expense_category_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (expense_category_id, subsidiary_id)
);

CREATE TABLE Expense_detail (
    amount NUMERIC(20, 2),
    currency_id NUMERIC(39, 0),
    exchange_rate NUMERIC(30, 15),
    expense_category_id NUMERIC(39, 0),
    expense_date TIMESTAMP,
    expense_detail_id NUMERIC(39, 0) PRIMARY KEY,
    foreign_amount NUMERIC(20, 2),
    foreign_rate NUMERIC(30, 15),
    has_receipt VARCHAR(3),
    is_paid_by_corp_credit_card VARCHAR(3),
    memo VARCHAR(999),
    quantity NUMERIC(18, 8),
    rate NUMERIC(30, 15),
    reference_number NUMERIC(5, 0),
    tax_amount NUMERIC(20, 2),
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0)
);

CREATE TABLE Expense_plan_lines (
    accounting_period_id NUMERIC(39, 0),
    amount NUMERIC(20, 2),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    deferred_expense_account_id NUMERIC(39, 0),
    expense_account_id NUMERIC(39, 0),
    is_recognized VARCHAR(3),
    journal_id NUMERIC(39, 0),
    plan_id NUMERIC(39, 0),
    planned_expense_type VARCHAR(250)
);

CREATE TABLE Expense_plans (
    accounting_period_id NUMERIC(39, 0),
    comments VARCHAR(500),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    end_date TIMESTAMP,
    expense_plan_status VARCHAR(128),
    expense_plan_type VARCHAR(128),
    expense_rule_id NUMERIC(39, 0),
    is_hold_expense VARCHAR(3),
    plan_id NUMERIC(39, 0) PRIMARY KEY,
    plan_number VARCHAR(99),
    reforecast_method VARCHAR(150),
    related_revenue_arrangement_id NUMERIC(39, 0),
    related_revenue_element_id NUMERIC(39, 0),
    residual NUMERIC(20, 2),
    start_date TIMESTAMP,
    transaction_book_id NUMERIC(39, 0),
    transaction_doc_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0)
);

CREATE TABLE Fair_value_prices (
    currency_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    end_date TIMESTAMP,
    fair_value_formula VARCHAR(200),
    fair_value_price_extid VARCHAR(255),
    fair_value_price_id NUMERIC(39, 0),
    fair_value_range_policy VARCHAR(128),
    high_value VARCHAR(42),
    is_vsoe VARCHAR(3),
    item_id NUMERIC(39, 0),
    item_revenue_category VARCHAR(250),
    low_value VARCHAR(42),
    start_date TIMESTAMP,
    unit_id NUMERIC(39, 0),
    unit_price NUMERIC(30, 15),
    units_type_id NUMERIC(39, 0)
);

CREATE TABLE Fixed_fee_charge_rules (
    amount NUMERIC(23, 5),
    billing_item NUMERIC(39, 0),
    charge_rule_id NUMERIC(39, 0),
    charge_rule_type VARCHAR(32),
    charge_stage VARCHAR(32),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(4000),
    end_date TIMESTAMP,
    external_id VARCHAR(255),
    fixed_fee_charge_rule_id NUMERIC(39, 0),
    form_template NUMERIC(39, 0),
    frequency VARCHAR(4000),
    period NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    project_task NUMERIC(39, 0),
    rule_name VARCHAR(200),
    start_date TIMESTAMP
);

CREATE TABLE Generic_resources (
    billing_class_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    generic_resource_extid VARCHAR(255),
    generic_resource_id NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    labor_cost NUMERIC(39, 0),
    price NUMERIC(39, 0),
    resource_name VARCHAR(83),
    subsidiary_id NUMERIC(39, 0),
    workcalendar_id NUMERIC(39, 0)
);

CREATE TABLE Gift_certificates (
    amount NUMERIC(39, 0),
    amount_available NUMERIC(39, 0),
    amount_available_billed NUMERIC(39, 0),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    expiration_date TIMESTAMP,
    from_name VARCHAR(600),
    gift_certificate_code VARCHAR(50),
    gift_certificate_id VARCHAR(50),
    gift_message VARCHAR(4000),
    include_child_subsidiaries VARCHAR(3),
    income_account_id NUMERIC(39, 0),
    is_active VARCHAR(3),
    item_id NUMERIC(39, 0),
    item_name VARCHAR(250),
    liability_account_id NUMERIC(39, 0),
    purchase_date TIMESTAMP,
    to_email VARCHAR(300),
    to_name VARCHAR(600)
);

CREATE TABLE Global_account_map (
    accounting_book_id NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_effective TIMESTAMP,
    date_end TIMESTAMP,
    date_last_modified TIMESTAMP,
    department_id NUMERIC(39, 0),
    destination_account_id NUMERIC(39, 0),
    form_template_component_id VARCHAR(16),
    form_template_id NUMERIC(39, 0),
    global_account_map_extid VARCHAR(255),
    global_account_map_id NUMERIC(39, 0) PRIMARY KEY,
    is_class_any VARCHAR(3),
    is_department_any VARCHAR(3),
    is_location_any VARCHAR(3),
    location_id NUMERIC(39, 0),
    source_account_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Global_inventory_relationships (
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    global_invt_relationship_extid VARCHAR(255),
    global_invt_relationship_id NUMERIC(39, 0) PRIMARY KEY,
    inventory_subsidiary_id NUMERIC(39, 0),
    is_all_locations_cust_return VARCHAR(3),
    is_all_locations_fulfillment VARCHAR(3),
    is_allow_cross_sub_cust_return VARCHAR(3),
    is_allow_cross_sub_fulfillment VARCHAR(3),
    is_inactive VARCHAR(3),
    originating_subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Group_test_cell (
    crm_group_id NUMERIC(39, 0),
    cumulativepct NUMERIC(39, 0),
    name VARCHAR(99),
    percentage NUMERIC(39, 0),
    previouspct NUMERIC(39, 0),
    test_cell_id NUMERIC(39, 0),
    PRIMARY KEY (test_cell_id)
);

CREATE TABLE Inbound_shipments (
    bill_status VARCHAR(2),
    currency_id NUMERIC(39, 0),
    date_actual_delivery TIMESTAMP,
    date_actual_shipping TIMESTAMP,
    date_create TIMESTAMP,
    date_expected_delivery TIMESTAMP,
    date_expected_shipping TIMESTAMP,
    inboundshipment_id NUMERIC(39, 0) PRIMARY KEY,
    memo VARCHAR(3000),
    shipment_number NUMERIC(39, 0),
    status VARCHAR(64)
);

CREATE TABLE Income_accounts (
    account_number VARCHAR(60),
    comments VARCHAR(25),
    current_balance NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    desription VARCHAR(60),
    full_name VARCHAR(4000),
    income_account_extid VARCHAR(255),
    income_account_id NUMERIC(39, 0) PRIMARY KEY,
    is_including_child_subs VARCHAR(3),
    is_summary VARCHAR(3),
    isinactive VARCHAR(3),
    legal_name VARCHAR(400),
    name VARCHAR(93),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Inventory_cost_template (
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    inv_cost_template_id NUMERIC(39, 0) PRIMARY KEY,
    inv_cost_template_memo VARCHAR(4000),
    inv_cost_template_name VARCHAR(100),
    isinactive VARCHAR(3),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Inventory_cost_template_items (
    inv_cost_template_id NUMERIC(39, 0),
    inv_cost_template_line_order NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    PRIMARY KEY (inv_cost_template_id, inv_cost_template_line_order)
);

CREATE TABLE Inventory_items (
    allow_drop_ship VARCHAR(3),
    alt_demand_source_item_id NUMERIC(39, 0),
    asset_account_id NUMERIC(39, 0),
    atp_lead_time NUMERIC(39, 0),
    atp_method VARCHAR(150),
    averagecost NUMERIC(30, 15),
    backward_consumption_days NUMERIC(39, 0),
    bill_exch_rate_var_account_id NUMERIC(39, 0),
    bill_price_variance_account_id NUMERIC(39, 0),
    bill_qty_variance_account_id NUMERIC(39, 0),
    cost_0 NUMERIC(30, 15),
    cost_accounting_status VARCHAR(4000),
    cost_category VARCHAR(50),
    costing_method VARCHAR(16),
    create_plan_on_event_type VARCHAR(128),
    created TIMESTAMP,
    current_on_order_count NUMERIC(21, 11),
    custreturn_variance_account_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    date_of_last_transaction TIMESTAMP,
    default_return_cost NUMERIC(30, 15),
    demand_source VARCHAR(50),
    demand_time_fence NUMERIC(39, 0),
    deposit VARCHAR(3),
    displayname VARCHAR(4000),
    distribution_category VARCHAR(60),
    distribution_network VARCHAR(100),
    dropship_expense_account_id NUMERIC(39, 0),
    expense_account_id NUMERIC(39, 0),
    featureddescription VARCHAR(65534),
    fixed_lot_size NUMERIC(39, 0),
    forward_consumption_days NUMERIC(39, 0),
    fraud_risk VARCHAR(128),
    full_name VARCHAR(550),
    fx_adjustment_account_id NUMERIC(39, 0),
    gain_loss_account_id NUMERIC(39, 0),
    handling_cost NUMERIC(30, 15),
    hazmat VARCHAR(1),
    hazmat_hazard_class VARCHAR(50),
    hazmat_id VARCHAR(50),
    hazmat_item_units VARCHAR(20),
    hazmat_item_units_qty NUMERIC(39, 0),
    hazmat_packing_group VARCHAR(10),
    hazmat_shipping_name VARCHAR(100),
    include_child_subsidiaries VARCHAR(3),
    income_account_id NUMERIC(39, 0),
    interco_expense_account_id NUMERIC(39, 0),
    interco_income_account_id NUMERIC(39, 0),
    invt_count_classification NUMERIC(39, 0),
    invt_count_interval NUMERIC(39, 0),
    is_cont_rev_handling VARCHAR(3),
    is_hold_rev_rec VARCHAR(3),
    is_moss VARCHAR(3),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    istaxable VARCHAR(3),
    item_extid VARCHAR(255),
    item_id NUMERIC(39, 0),
    item_revenue_category VARCHAR(250),
    last_cogs_correction TIMESTAMP,
    last_invt_count_date TIMESTAMP,
    last_purchase_price NUMERIC(39, 0),
    lot_numbered_item VARCHAR(1),
    lot_sizing_method VARCHAR(50),
    match_bill_to_receipt VARCHAR(1),
    matrix_type VARCHAR(6),
    modified TIMESTAMP,
    name VARCHAR(250),
    next_invt_count_date TIMESTAMP,
    ns_lead_time NUMERIC(39, 0),
    offersupport VARCHAR(3),
    onspecial VARCHAR(3),
    parent_id NUMERIC(39, 0),
    payment_method_id NUMERIC(39, 0),
    periodic_lot_size_days NUMERIC(39, 0),
    periodic_lot_size_type VARCHAR(50),
    pref_purchase_tax_id NUMERIC(39, 0),
    pref_sale_tax_id NUMERIC(39, 0),
    pref_stock_level NUMERIC(39, 0),
    prices_include_tax VARCHAR(1),
    pricing_group_id NUMERIC(39, 0),
    print_sub_items VARCHAR(3),
    prod_price_var_account_id NUMERIC(39, 0),
    prod_qty_var_account_id NUMERIC(39, 0),
    purchase_price_var_account_id NUMERIC(39, 0),
    purchase_unit_id NUMERIC(39, 0),
    purchasedescription VARCHAR(4000),
    quantityavailable NUMERIC(39, 0),
    quantitybackordered NUMERIC(39, 0),
    quantityonhnad NUMERIC(21, 11),
    reorder_multiple NUMERIC(39, 0),
    reorderpoint NUMERIC(21, 11),
    replenishment_method VARCHAR(50),
    reschedule_in_days NUMERIC(39, 0),
    reschedule_out_days NUMERIC(39, 0),
    rev_rec_forecast_rule_id NUMERIC(39, 0),
    rev_rec_rule_id NUMERIC(39, 0),
    revenue_allocation_group VARCHAR(60),
    round_up_as_component VARCHAR(3),
    safety_stock_days NUMERIC(39, 0),
    safety_stock_level NUMERIC(39, 0),
    sale_unit_id NUMERIC(39, 0),
    salesdescription VARCHAR(4000),
    salesprice VARCHAR(42),
    scrap_account_id NUMERIC(39, 0),
    serialized_item VARCHAR(1),
    shipping_cost NUMERIC(30, 15),
    specialsdescription VARCHAR(65534),
    stock_unit_id NUMERIC(39, 0),
    storedescription VARCHAR(4000),
    storedetaileddescription VARCHAR(65534),
    storedisplayname VARCHAR(4000),
    subtype VARCHAR(10),
    supply_time_fence NUMERIC(39, 0),
    supply_type VARCHAR(50),
    tax_item_id NUMERIC(39, 0),
    totalvalue NUMERIC(29, 11),
    transferprice NUMERIC(30, 15),
    units_type_id NUMERIC(39, 0),
    upc_code VARCHAR(180),
    use_component_yield VARCHAR(3),
    vendor_id NUMERIC(39, 0),
    vendorname VARCHAR(250),
    vendreturn_variance_account_id NUMERIC(39, 0),
    vsoe_deferral VARCHAR(28),
    vsoe_delivered VARCHAR(3),
    vsoe_discount VARCHAR(12),
    vsoe_price NUMERIC(30, 15),
    weight NUMERIC(21, 11),
    weight_in_user_defined_unit NUMERIC(39, 0),
    weight_unit_index NUMERIC(39, 0),
    wip_account_id NUMERIC(39, 0),
    wip_cost_variance_account_id NUMERIC(39, 0),
    work_order_lead_time NUMERIC(39, 0)
);

CREATE TABLE Inventory_number (
    available_count NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    expiration_date TIMESTAMP,
    in_transit_count NUMERIC(39, 0),
    inventory_number VARCHAR(100),
    inventory_number_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    number_type VARCHAR(6),
    on_hand_count NUMERIC(39, 0),
    on_order_count NUMERIC(39, 0)
);

CREATE TABLE Items (
    allow_drop_ship VARCHAR(3),
    alt_demand_source_item_id NUMERIC(39, 0),
    asset_account_id NUMERIC(39, 0),
    atp_lead_time NUMERIC(39, 0),
    atp_method VARCHAR(150),
    available_to_partners VARCHAR(3),
    averagecost NUMERIC(30, 15),
    backward_consumption_days NUMERIC(39, 0),
    bill_exch_rate_var_account_id NUMERIC(39, 0),
    bill_price_variance_account_id NUMERIC(39, 0),
    bill_qty_variance_account_id NUMERIC(39, 0),
    build_sub_assemblies VARCHAR(1),
    class_id NUMERIC(39, 0),
    consumption_unit_id NUMERIC(39, 0),
    cost_0 NUMERIC(30, 15),
    cost_category VARCHAR(50),
    cost_estimate_type VARCHAR(200),
    costing_method VARCHAR(16),
    country_of_manufacture VARCHAR(6),
    create_plan_on_event_type VARCHAR(128),
    created TIMESTAMP,
    current_on_order_count NUMERIC(21, 11),
    custreturn_variance_account_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    date_of_last_transaction TIMESTAMP,
    default_return_cost NUMERIC(30, 15),
    deferred_expense_account_id NUMERIC(39, 0),
    deferred_revenue_account_id NUMERIC(39, 0),
    demand_source VARCHAR(50),
    demand_time_fence NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    deposit VARCHAR(3),
    displayname VARCHAR(4000),
    distribution_category VARCHAR(60),
    distribution_network VARCHAR(100),
    dropship_expense_account_id NUMERIC(39, 0),
    effective_bom_control_type VARCHAR(150),
    expense_account_id NUMERIC(39, 0),
    featureddescription VARCHAR(65534),
    featureditem VARCHAR(3),
    fixed_lot_size NUMERIC(39, 0),
    forward_consumption_days NUMERIC(39, 0),
    fraud_risk VARCHAR(128),
    full_name VARCHAR(550),
    fx_adjustment_account_id NUMERIC(39, 0),
    gain_loss_account_id NUMERIC(39, 0),
    handling_cost NUMERIC(30, 15),
    hazmat VARCHAR(1),
    hazmat_hazard_class VARCHAR(50),
    hazmat_id VARCHAR(50),
    hazmat_item_units VARCHAR(20),
    hazmat_item_units_qty NUMERIC(39, 0),
    hazmat_packing_group VARCHAR(10),
    hazmat_shipping_name VARCHAR(100),
    include_child_subsidiaries VARCHAR(3),
    income_account_id NUMERIC(39, 0),
    interco_expense_account_id NUMERIC(39, 0),
    interco_income_account_id NUMERIC(39, 0),
    invt_count_classification NUMERIC(39, 0),
    invt_count_interval NUMERIC(39, 0),
    is_cont_rev_handling VARCHAR(3),
    is_enforce_min_qty_internally VARCHAR(3),
    is_hold_rev_rec VARCHAR(3),
    is_moss VARCHAR(3),
    is_phantom VARCHAR(3),
    is_special_order_item VARCHAR(3),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    istaxable VARCHAR(3),
    item_defined_cost NUMERIC(30, 15),
    item_extid VARCHAR(255),
    item_id NUMERIC(39, 0) PRIMARY KEY,
    item_revenue_category VARCHAR(250),
    last_cogs_correction TIMESTAMP,
    last_invt_count_date TIMESTAMP,
    last_purchase_price NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    lot_numbered_item VARCHAR(1),
    lot_sizing_method VARCHAR(50),
    manufacturer VARCHAR(200),
    manufacturing_charge_item VARCHAR(3),
    match_bill_to_receipt VARCHAR(1),
    matrix_type VARCHAR(6),
    maximum_quantity NUMERIC(39, 0),
    minimum_quantity NUMERIC(39, 0),
    modified TIMESTAMP,
    mpn VARCHAR(100),
    name VARCHAR(250),
    next_invt_count_date TIMESTAMP,
    ns_lead_time NUMERIC(39, 0),
    offersupport VARCHAR(3),
    onspecial VARCHAR(3),
    overhead_type VARCHAR(100),
    parent_id NUMERIC(39, 0),
    payment_method_id NUMERIC(39, 0),
    periodic_lot_size_days NUMERIC(39, 0),
    periodic_lot_size_type VARCHAR(50),
    pref_purchase_tax_id NUMERIC(39, 0),
    pref_sale_tax_id NUMERIC(39, 0),
    pref_stock_level NUMERIC(39, 0),
    prices_include_tax VARCHAR(1),
    pricing_group_id NUMERIC(39, 0),
    print_sub_items VARCHAR(3),
    prod_price_var_account_id NUMERIC(39, 0),
    prod_qty_var_account_id NUMERIC(39, 0),
    purchase_price_var_account_id NUMERIC(39, 0),
    purchase_unit_id NUMERIC(39, 0),
    purchasedescription VARCHAR(4000),
    purchaseorderamount NUMERIC(20, 2),
    purchaseorderquantity NUMERIC(18, 8),
    purchaseorderquantitydiff NUMERIC(18, 8),
    quantityavailable NUMERIC(39, 0),
    quantitybackordered NUMERIC(39, 0),
    quantityonhand NUMERIC(21, 11),
    receiptamount NUMERIC(20, 2),
    receiptquantity NUMERIC(18, 8),
    receiptquantitydiff NUMERIC(18, 8),
    reorder_multiple NUMERIC(39, 0),
    reorderpoint NUMERIC(21, 11),
    replenishment_method VARCHAR(50),
    resalable VARCHAR(3),
    reschedule_in_days NUMERIC(39, 0),
    reschedule_out_days NUMERIC(39, 0),
    rev_rec_forecast_rule_id NUMERIC(39, 0),
    rev_rec_rule_id NUMERIC(39, 0),
    revenue_allocation_group VARCHAR(60),
    round_up_as_component VARCHAR(3),
    safety_stock_days NUMERIC(39, 0),
    safety_stock_level NUMERIC(39, 0),
    sale_unit_id NUMERIC(39, 0),
    salesdescription VARCHAR(4000),
    salesprice VARCHAR(42),
    scrap_account_id NUMERIC(39, 0),
    serialized_item VARCHAR(1),
    shippingcost NUMERIC(30, 15),
    special_work_order_item VARCHAR(1),
    specialsdescription VARCHAR(65534),
    stock_unit_id NUMERIC(39, 0),
    storedescription VARCHAR(4000),
    storedetaileddescription VARCHAR(65534),
    storedisplayname VARCHAR(4000),
    subtype VARCHAR(10),
    supply_time_fence NUMERIC(39, 0),
    supply_type VARCHAR(50),
    tax_item_id NUMERIC(39, 0),
    totalvalue NUMERIC(29, 11),
    transferprice NUMERIC(30, 15),
    type_name VARCHAR(128),
    unbuild_variance_account_id NUMERIC(39, 0),
    units_type_id NUMERIC(39, 0),
    upc_code VARCHAR(180),
    use_component_yield VARCHAR(3),
    vendor_id NUMERIC(39, 0),
    vendorname VARCHAR(250),
    vendreturn_variance_account_id NUMERIC(39, 0),
    vsoe_deferral VARCHAR(28),
    vsoe_delivered VARCHAR(3),
    vsoe_discount VARCHAR(12),
    vsoe_price NUMERIC(30, 15),
    weight NUMERIC(21, 11),
    weight_in_user_defined_unit NUMERIC(39, 0),
    weight_unit_index NUMERIC(39, 0),
    wip_account_id NUMERIC(39, 0),
    wip_cost_variance_account_id NUMERIC(39, 0),
    work_order_lead_time NUMERIC(39, 0)
);

CREATE TABLE Item_account_map (
    accounting_book_id NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_effective TIMESTAMP,
    date_end TIMESTAMP,
    date_last_modified TIMESTAMP,
    department_id NUMERIC(39, 0),
    destination_account_id NUMERIC(39, 0),
    form_template_component_id VARCHAR(16),
    form_template_id NUMERIC(39, 0),
    is_class_any VARCHAR(3),
    is_department_any VARCHAR(3),
    is_location_any VARCHAR(3),
    item_account_map_extid VARCHAR(255),
    item_account_map_id NUMERIC(39, 0) PRIMARY KEY,
    item_account_type VARCHAR(150),
    location_id NUMERIC(39, 0),
    source_account_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Item_billing_rates (
    billing_class_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    discount_pct NUMERIC(5, 2),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    item_id NUMERIC(39, 0),
    item_price_extid VARCHAR(255),
    item_price_id NUMERIC(39, 0),
    item_unit_price NUMERIC(30, 15),
    name VARCHAR(60),
    PRIMARY KEY (billing_class_id, currency_id, item_id, item_price_id)
);

CREATE TABLE Item_demand_plan_lines (
    demand_date TIMESTAMP,
    item_demand_plan_id NUMERIC(39, 0),
    quantity NUMERIC(39, 0)
);

CREATE TABLE Item_location_map (
    atp_lead_time NUMERIC(39, 0),
    available_count NUMERIC(39, 0),
    average_cost NUMERIC(30, 15),
    backward_consumption_days NUMERIC(39, 0),
    cost_0 NUMERIC(30, 15),
    cost_accounting_status VARCHAR(4000),
    costing_lot_size NUMERIC(39, 0),
    default_return_cost NUMERIC(30, 15),
    demand_source VARCHAR(50),
    demand_time_fence NUMERIC(39, 0),
    fixed_lot_size NUMERIC(39, 0),
    forward_consumption_days NUMERIC(39, 0),
    in_transit_count NUMERIC(18, 8),
    inventory_cost_template NUMERIC(39, 0),
    invt_count_classification NUMERIC(39, 0),
    invt_count_interval NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    last_invt_count_date TIMESTAMP,
    last_purchase_price NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    lot_sizing_method VARCHAR(50),
    next_invt_count_date TIMESTAMP,
    ns_lead_time NUMERIC(39, 0),
    on_hand_count NUMERIC(21, 11),
    on_hand_value NUMERIC(29, 11),
    on_order_count NUMERIC(21, 11),
    periodic_lot_size_days NUMERIC(39, 0),
    periodic_lot_size_type VARCHAR(50),
    pref_stock_level NUMERIC(39, 0),
    quantitybackordered NUMERIC(39, 0),
    reorder_point NUMERIC(21, 11),
    reschedule_in_days NUMERIC(39, 0),
    reschedule_out_days NUMERIC(39, 0),
    safety_stock_level NUMERIC(39, 0),
    supply_time_fence NUMERIC(39, 0),
    supply_type VARCHAR(50),
    wip VARCHAR(1)
);

CREATE TABLE Item_price_history (
    currency_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    item_quantity_id NUMERIC(39, 0),
    min_count NUMERIC(15, 5),
    price_type_id NUMERIC(39, 0),
    unit_price NUMERIC(30, 15),
    version_0 NUMERIC(39, 0)
);

CREATE TABLE Item_prices (
    currency_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    discount_pct NUMERIC(5, 2),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    item_id NUMERIC(39, 0),
    item_price_extid VARCHAR(255),
    item_price_id NUMERIC(39, 0),
    item_quantity_id NUMERIC(39, 0),
    item_unit_price NUMERIC(30, 15),
    name VARCHAR(60)
);

CREATE TABLE Item_quantity (
    item_id NUMERIC(39, 0),
    item_quantity_id NUMERIC(39, 0),
    max_count NUMERIC(15, 5),
    min_count NUMERIC(15, 5),
    PRIMARY KEY (item_id, item_quantity_id)
);

CREATE TABLE Item_shipmethods (
    is_default VARCHAR(3),
    item_id NUMERIC(39, 0),
    shipmethod_id NUMERIC(39, 0),
    PRIMARY KEY (item_id, shipmethod_id)
);

CREATE TABLE Item_site_categories (
    category_id NUMERIC(39, 0),
    category_sequence NUMERIC(39, 0),
    category_type VARCHAR(20),
    default_name VARCHAR(299),
    description VARCHAR(4000),
    full_name VARCHAR(199),
    ishidden VARCHAR(1),
    isinactive VARCHAR(1),
    ispreferred VARCHAR(1),
    item_id NUMERIC(39, 0),
    long_description VARCHAR(65534),
    parent_category_id NUMERIC(39, 0),
    section_created_by NUMERIC(39, 0),
    section_created_date TIMESTAMP,
    section_modified_by NUMERIC(39, 0),
    section_modified_date TIMESTAMP
);

CREATE TABLE Item_subsidiary_map (
    item_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (item_id, subsidiary_id)
);

CREATE TABLE Item_supply_plan_attributes (
    demand_source VARCHAR(50),
    end_date TIMESTAMP,
    item_supply_plan_id NUMERIC(39, 0),
    lead_time NUMERIC(39, 0),
    quantity_on_hand NUMERIC(21, 11),
    safety_stock NUMERIC(18, 8),
    start_date TIMESTAMP
);

CREATE TABLE Item_supply_plan_lines (
    is_order_created VARCHAR(3),
    item_supply_plan_id NUMERIC(39, 0),
    line_id NUMERIC(39, 0),
    order_date TIMESTAMP,
    order_type VARCHAR(192),
    quantity NUMERIC(39, 0),
    receipt_date TIMESTAMP,
    source_location_id NUMERIC(39, 0)
);

CREATE TABLE Item_supply_plan_source (
    assembly_parent_id NUMERIC(39, 0),
    date_order TIMESTAMP,
    is_detail_transaction_line VARCHAR(3),
    item_supply_plan_id NUMERIC(39, 0),
    quantity NUMERIC(39, 0),
    ship_receipt_date TIMESTAMP,
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0),
    type_id VARCHAR(40)
);

CREATE TABLE Item_supply_plan_source_types (
    name VARCHAR(100),
    type_id VARCHAR(40)
);

CREATE TABLE Item_vendor_map (
    is_preferred VARCHAR(3),
    item_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    vendor_code VARCHAR(250),
    vendor_id NUMERIC(39, 0),
    PRIMARY KEY (item_id, subsidiary_id, vendor_id)
);

CREATE TABLE Item_vendor_pricing (
    cost_0 NUMERIC(30, 15),
    cost_is_percentage VARCHAR(1),
    currency_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    vendor_id NUMERIC(39, 0)
);

CREATE TABLE Item_collections (
    description VARCHAR(2000),
    is_inactive VARCHAR(3),
    item_collection_extid VARCHAR(255),
    item_collection_id NUMERIC(39, 0) PRIMARY KEY,
    name VARCHAR(200)
);

CREATE TABLE Item_collection_item_map (
    item_collection_id NUMERIC(39, 0),
    item_collection_item_map_id NUMERIC(39, 0) PRIMARY KEY,
    item_id NUMERIC(39, 0),
    item_map_extid VARCHAR(255)
);

CREATE TABLE Item_demand_plans (
    alt_demand_source_item_id NUMERIC(39, 0),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    historical_analysis_duration NUMERIC(39, 0),
    item_demand_plan_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    last_modified_date TIMESTAMP,
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    projection_duration NUMERIC(39, 0),
    projection_interval VARCHAR(10),
    projection_method VARCHAR(50),
    projection_start_date TIMESTAMP,
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Item_fulfillments (
    accounting_period_id NUMERIC(39, 0),
    ancillary_endorsement VARCHAR(32),
    b13a_filling_option VARCHAR(24),
    b13a_statement_data VARCHAR(50),
    backup_ship_notification_email VARCHAR(100),
    billaddress VARCHAR(999),
    booking_confirmation_number VARCHAR(64),
    carrier_identification_code VARCHAR(32),
    created_by_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    date_blanket_period_end TIMESTAMP,
    date_blanket_period_start TIMESTAMP,
    date_closed TIMESTAMP,
    date_created TIMESTAMP,
    date_future_shipping TIMESTAMP,
    date_home_delivery TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_license TIMESTAMP,
    date_sales_effective TIMESTAMP,
    date_transaction TIMESTAMP,
    delivery_instructions VARCHAR(64),
    eccn VARCHAR(8),
    email VARCHAR(256),
    entity_id NUMERIC(39, 0),
    entry_number VARCHAR(32),
    exchange_rate NUMERIC(30, 15),
    export_type VARCHAR(22),
    fax VARCHAR(100),
    fedex_ship_alert VARCHAR(100),
    fob VARCHAR(13),
    handling_cost NUMERIC(39, 0),
    has_cert_of_origin VARCHAR(3),
    has_commercial_invoice VARCHAR(3),
    has_nafta_cert_of_origin VARCHAR(3),
    has_pro_forma_invoice VARCHAR(3),
    hold_at_location_address_one VARCHAR(150),
    hold_at_location_address_three VARCHAR(150),
    hold_at_location_address_two VARCHAR(150),
    hold_at_location_city VARCHAR(50),
    hold_at_location_country VARCHAR(50),
    hold_at_location_loc_phone VARCHAR(24),
    hold_at_location_phone VARCHAR(24),
    hold_at_location_state VARCHAR(50),
    hold_at_location_zip VARCHAR(36),
    home_delivery_type VARCHAR(16),
    in_bond_code VARCHAR(2),
    international_exemption_number VARCHAR(32),
    is_certified_mail VARCHAR(3),
    is_fdx_signature_home_delivery VARCHAR(3),
    is_held_at_location VARCHAR(3),
    is_holiday_delivery VARCHAR(3),
    is_inside_delivery VARCHAR(3),
    is_inside_pickup VARCHAR(3),
    is_intercompany VARCHAR(3),
    is_memorized VARCHAR(3),
    is_online_bill_pay VARCHAR(3),
    is_related_parties_transaction VARCHAR(3),
    is_routed_export_transaction VARCHAR(3),
    is_saturday_delivery VARCHAR(3),
    is_saturday_pickup VARCHAR(3),
    is_saturday_service VARCHAR(3),
    is_tax_reg_override VARCHAR(3),
    is_visible_in_customer_center VARCHAR(3),
    is_weekend_delivery VARCHAR(3),
    license_exception VARCHAR(4),
    license_number VARCHAR(35),
    memo VARCHAR(4000),
    message VARCHAR(999),
    method_of_transport VARCHAR(64),
    needs_bill VARCHAR(3),
    notification_email_message VARCHAR(500),
    promotion_code_id NUMERIC(39, 0),
    reason_for_export VARCHAR(20),
    recipient_customs_id VARCHAR(64),
    recipient_customs_id_type VARCHAR(32),
    recipient_tax_id VARCHAR(15),
    related_tranid VARCHAR(138),
    return_type VARCHAR(32),
    return_type_description VARCHAR(30),
    ship_notification_email VARCHAR(100),
    ship_notification_email_two VARCHAR(100),
    shipaddress VARCHAR(999),
    shipping_cost NUMERIC(39, 0),
    shipping_item_id NUMERIC(39, 0),
    status VARCHAR(480),
    tax_reg_id NUMERIC(39, 0),
    terms_freight_charge NUMERIC(39, 0),
    terms_insurance_charge NUMERIC(39, 0),
    terms_of_sale VARCHAR(32),
    title VARCHAR(200),
    total_package_weight_in_lbs NUMERIC(39, 0),
    tranid VARCHAR(138),
    transaction_extid VARCHAR(255),
    transaction_id NUMERIC(39, 0),
    transfer_location_id NUMERIC(39, 0),
    use_backup_email VARCHAR(3),
    use_fedex_ship_alert VARCHAR(3),
    use_ship_notification_email VARCHAR(3)
);

CREATE TABLE Item_group (
    bom_quantity NUMERIC(18, 8),
    component_yield NUMERIC(39, 0),
    effective_date TIMESTAMP,
    effective_revision NUMERIC(39, 0),
    item_group_id NUMERIC(39, 0) PRIMARY KEY,
    item_source VARCHAR(30),
    line_id NUMERIC(39, 0),
    member_id NUMERIC(39, 0),
    obsolete_date TIMESTAMP,
    obsolete_revision NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    quantity NUMERIC(18, 8),
    rate_plan_id NUMERIC(39, 0),
    unit_of_measure_id NUMERIC(39, 0)
);

CREATE TABLE Item_revisions (
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    effective_date TIMESTAMP,
    externalid VARCHAR(255),
    isinactive VARCHAR(3),
    item_revision_id NUMERIC(39, 0) PRIMARY KEY,
    item_revision_item NUMERIC(39, 0),
    item_revision_name VARCHAR(100),
    memo VARCHAR(255),
    obsolete_date TIMESTAMP
);

CREATE TABLE Item_supply_plans (
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    item_id NUMERIC(39, 0),
    item_supply_plan_id NUMERIC(39, 0),
    last_modified_date TIMESTAMP,
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Job_resource_role (
    description VARCHAR(999),
    has_own_time_approval VARCHAR(3),
    has_replace_assignments VARCHAR(3),
    is_project_time_approver VARCHAR(3),
    isinactive VARCHAR(3),
    job_resource_role_id NUMERIC(39, 0) PRIMARY KEY,
    name VARCHAR(50),
    send_mail_for_ratoff_conflict VARCHAR(3)
);

CREATE TABLE Job_resources (
    job_id NUMERIC(39, 0),
    resource_id NUMERIC(39, 0),
    resource_role_id NUMERIC(39, 0),
    PRIMARY KEY (job_id, resource_id, resource_role_id)
);

CREATE TABLE Job_types (
    isinactive VARCHAR(3),
    job_type_extid VARCHAR(255),
    job_type_id NUMERIC(39, 0) PRIMARY KEY,
    name VARCHAR(31),
    parent_id NUMERIC(39, 0)
);

CREATE TABLE Locations (
    address VARCHAR(999),
    address_one VARCHAR(150),
    address_three VARCHAR(150),
    address_two VARCHAR(150),
    addressee VARCHAR(100),
    attention VARCHAR(150),
    city VARCHAR(50),
    country VARCHAR(50),
    date_last_modified TIMESTAMP,
    full_name VARCHAR(4000),
    inventory_available VARCHAR(3),
    inventory_available_web_store VARCHAR(3),
    is_include_in_supply_planning VARCHAR(3),
    isinactive VARCHAR(3),
    location_extid VARCHAR(255),
    location_id NUMERIC(39, 0) PRIMARY KEY,
    name VARCHAR(31),
    parent_id NUMERIC(39, 0),
    phone VARCHAR(100),
    return_address_one VARCHAR(150),
    return_address_two VARCHAR(150),
    return_city VARCHAR(50),
    return_country VARCHAR(50),
    return_state VARCHAR(50),
    return_zipcode VARCHAR(36),
    returnaddress VARCHAR(999),
    state VARCHAR(50),
    tran_num_prefix VARCHAR(8),
    use_bins VARCHAR(3),
    zipcode VARCHAR(36)
);

CREATE TABLE Location_costing_groups (
    currency_id NUMERIC(39, 0),
    location_costing_group_id NUMERIC(38, 0) PRIMARY KEY,
    location_costing_group_name VARCHAR(100),
    memo VARCHAR(999)
);

CREATE TABLE Location_costing_grp_locations (
    location_costing_group_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    PRIMARY KEY (location_costing_group_id, location_id)
);

CREATE TABLE Memorized_trans (
    action VARCHAR(24),
    automatic_entry VARCHAR(3),
    date_next_posting TIMESTAMP,
    date_subsequent_posting TIMESTAMP,
    days_in_advance NUMERIC(39, 0),
    employee_id NUMERIC(39, 0),
    frequency VARCHAR(128),
    ingroup VARCHAR(3),
    is_inactive VARCHAR(3),
    is_indefinite VARCHAR(3),
    isdeferred VARCHAR(3),
    isgroup VARCHAR(3),
    memorized_id NUMERIC(39, 0),
    next_occurance TIMESTAMP,
    number_remaining NUMERIC(39, 0),
    repeat_every NUMERIC(39, 0),
    subsequent_occurance TIMESTAMP,
    time_period VARCHAR(24),
    transaction_id NUMERIC(39, 0),
    update_addresses VARCHAR(3),
    update_prices VARCHAR(3)
);

CREATE TABLE Message (
    author_id NUMERIC(39, 0),
    bcc VARCHAR(999),
    cc VARCHAR(999),
    company_id NUMERIC(39, 0),
    date_0 TIMESTAMP,
    date_last_modified TIMESTAMP,
    event_id NUMERIC(39, 0),
    from_0 VARCHAR(254),
    internal_only VARCHAR(3),
    is_emailed VARCHAR(3),
    is_incoming VARCHAR(3),
    message VARCHAR(65534),
    message_extid VARCHAR(255),
    message_id NUMERIC(39, 0) PRIMARY KEY,
    message_type_id VARCHAR(19),
    recipient_id NUMERIC(39, 0),
    record_id NUMERIC(39, 0),
    record_type_id NUMERIC(39, 0),
    subject VARCHAR(199),
    template_id NUMERIC(39, 0),
    to_0 VARCHAR(300),
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Messagerecipient (
    entity_id NUMERIC(39, 0),
    message_id NUMERIC(39, 0)
);

CREATE TABLE Mfg_cost_template (
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    externalid VARCHAR(255),
    isinactive VARCHAR(3),
    mfg_cost_template_id NUMERIC(39, 0) PRIMARY KEY,
    mfg_cost_template_memo VARCHAR(4000),
    mfg_cost_template_name VARCHAR(100),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Mfg_cost_template_items (
    item_id NUMERIC(39, 0),
    mfg_cost_template_id NUMERIC(39, 0),
    mfg_cost_template_line_order NUMERIC(39, 0),
    PRIMARY KEY (mfg_cost_template_id, mfg_cost_template_line_order)
);

CREATE TABLE Mfg_routing (
    bom_id NUMERIC(39, 0),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    externalid VARCHAR(255),
    is_autocalculate_lag VARCHAR(3),
    isdefault VARCHAR(3),
    isinactive VARCHAR(3),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    mfg_routing_id NUMERIC(39, 0),
    mfg_routing_memo VARCHAR(4000),
    mfg_routing_name VARCHAR(100)
);

CREATE TABLE Mfg_routing_steps (
    lag_amount NUMERIC(39, 0),
    lag_type VARCHAR(100),
    lag_units VARCHAR(20),
    mfg_cost_template_id NUMERIC(39, 0),
    mfg_routing_id NUMERIC(39, 0),
    mfg_work_center_id NUMERIC(39, 0),
    name VARCHAR(100),
    operation_yield NUMERIC(39, 0),
    run_rate NUMERIC(39, 0),
    sequence_0 NUMERIC(39, 0),
    setup_time NUMERIC(39, 0)
);

CREATE TABLE Nexus (
    country VARCHAR(100),
    date_valid_since TIMESTAMP,
    date_valid_until TIMESTAMP,
    description VARCHAR(100),
    hierarchy_level NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    is_tax_date_from_fulfillment VARCHAR(3),
    nexus_id NUMERIC(39, 0) PRIMARY KEY,
    parent_id NUMERIC(39, 0),
    state VARCHAR(20),
    tax_agency_id NUMERIC(39, 0),
    taxcode_id NUMERIC(39, 0),
    vendtax1_id NUMERIC(39, 0),
    vendtax2_id NUMERIC(39, 0)
);

CREATE TABLE Nlcompany (
    address VARCHAR(2997),
    address_1 VARCHAR(450),
    address_2 VARCHAR(450),
    address_3 VARCHAR(150),
    city VARCHAR(150),
    company_name VARCHAR(83),
    country VARCHAR(2),
    e_mail VARCHAR(254),
    fax VARCHAR(21),
    federal_ein VARCHAR(40),
    frst_fiscal_month VARCHAR(3),
    legal_name VARCHAR(83),
    logo_url VARCHAR(80),
    parent_comp_id VARCHAR(16),
    parent_company VARCHAR(1),
    phone VARCHAR(100),
    return_address VARCHAR(2997),
    shipping_address VARCHAR(2997),
    state1 VARCHAR(50),
    state1_taxid VARCHAR(40),
    state2 VARCHAR(2),
    state2_taxid VARCHAR(20),
    state3 VARCHAR(2),
    state3_taxid VARCHAR(20),
    state4 VARCHAR(2),
    state4_taxid VARCHAR(20),
    state5 VARCHAR(2),
    state5_taxid VARCHAR(20),
    web_site VARCHAR(64),
    zip VARCHAR(108)
);

CREATE TABLE Notes_system (
    author_id NUMERIC(39, 0),
    comments VARCHAR(4000),
    company_id NUMERIC(39, 0),
    custom_field VARCHAR(40),
    date_last_modified TIMESTAMP,
    direction VARCHAR,
    event_id NUMERIC(39, 0),
    isinactive VARCHAR(3),
    item_id NUMERIC(39, 0),
    line_id NUMERIC(39, 0),
    line_transaction_id NUMERIC(39, 0),
    name VARCHAR(283),
    note_id VARCHAR,
    note_type VARCHAR(40),
    note_type_description VARCHAR(75),
    note_type_extid VARCHAR(255),
    note_type_id NUMERIC(39, 0),
    record_id NUMERIC(39, 0),
    record_type_id NUMERIC(39, 0),
    role_id NUMERIC(39, 0),
    standard_field VARCHAR(40),
    system_use VARCHAR(3),
    time_entered TIMESTAMP,
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Notes_system_custom (
    author_id NUMERIC(39, 0),
    comments VARCHAR(4000),
    company_id NUMERIC(39, 0),
    custom_field VARCHAR(40),
    customfield_created_by NUMERIC(39, 0),
    customfield_created_date TIMESTAMP,
    customfield_modified_by NUMERIC(39, 0),
    customfield_modified_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    direction VARCHAR,
    event_id NUMERIC(39, 0),
    isinactive VARCHAR(3),
    item_id NUMERIC(39, 0),
    line_id NUMERIC(39, 0),
    line_transaction_id NUMERIC(39, 0),
    name VARCHAR(227),
    note_id VARCHAR,
    note_type VARCHAR(40),
    note_type_description VARCHAR(75),
    note_type_extid VARCHAR(255),
    note_type_id NUMERIC(39, 0),
    record_id NUMERIC(39, 0),
    record_type_id NUMERIC(39, 0),
    role_id NUMERIC(39, 0),
    standard_field VARCHAR(40),
    system_use VARCHAR(3),
    time_entered TIMESTAMP,
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Notes_user (
    author_id NUMERIC(39, 0),
    comments VARCHAR(4000),
    company_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    direction VARCHAR(128),
    event_id NUMERIC(39, 0),
    isinactive VARCHAR(3),
    item_id NUMERIC(39, 0),
    name VARCHAR(120),
    note_extid VARCHAR(255),
    note_id NUMERIC(39, 0) PRIMARY KEY,
    note_type VARCHAR(40),
    note_type_description VARCHAR(75),
    note_type_extid VARCHAR(255),
    note_type_id NUMERIC(39, 0),
    record_id NUMERIC(39, 0),
    record_type_id NUMERIC(39, 0),
    system_use VARCHAR(3),
    time_entered TIMESTAMP,
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Notetype (
    date_last_modified TIMESTAMP,
    description VARCHAR(75),
    is_inactive VARCHAR(1),
    note_type VARCHAR(40),
    note_type_extid VARCHAR(255),
    note_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Opportunities (
    accounting_period_id NUMERIC(39, 0),
    action_item VARCHAR(199),
    billaddress VARCHAR(999),
    closed TIMESTAMP,
    company_status_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    email VARCHAR(256),
    end_date TIMESTAMP,
    expected_close TIMESTAMP,
    fax VARCHAR(100),
    fob VARCHAR(13),
    forecast_type VARCHAR(384),
    is_tax_reg_override VARCHAR(3),
    lead_source_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    memorized VARCHAR(3),
    message VARCHAR(999),
    needs_bill VARCHAR(3),
    partner_id NUMERIC(39, 0),
    payment_terms_id NUMERIC(39, 0),
    probability NUMERIC(6, 2),
    projected_total NUMERIC(20, 2),
    promotion_code_instance_id NUMERIC(39, 0),
    related_tranid VARCHAR(138),
    renewal TIMESTAMP,
    reversing_transaction_id NUMERIC(39, 0),
    sales_rep_id NUMERIC(39, 0),
    shipaddress VARCHAR(999),
    shipment_received TIMESTAMP,
    shipping_item_id NUMERIC(39, 0),
    start_date TIMESTAMP,
    status VARCHAR(480),
    tax_reg_id NUMERIC(39, 0),
    title VARCHAR(200),
    trandate TIMESTAMP,
    tranid VARCHAR(138),
    transaction_extid VARCHAR(255),
    transaction_id NUMERIC(39, 0),
    transaction_partner VARCHAR(40),
    transaction_type VARCHAR(192),
    weighted_total NUMERIC(39, 0),
    win_loss_reason_id NUMERIC(39, 0)
);

CREATE TABLE Opportunity_lines (
    account_id NUMERIC(39, 0),
    amount NUMERIC(20, 2),
    amount_foreign_linked NUMERIC(30, 15),
    amount_linked NUMERIC(20, 2),
    amount_pending NUMERIC(20, 2),
    amount_taxable NUMERIC(20, 2),
    amount_taxed NUMERIC(20, 2),
    class_id NUMERIC(39, 0),
    company_id NUMERIC(39, 0),
    date_cleared TIMESTAMP,
    date_closed TIMESTAMP,
    date_last_modified TIMESTAMP,
    department_id NUMERIC(39, 0),
    do_not_display_line VARCHAR(3),
    do_not_print_line VARCHAR(3),
    expense_category_id NUMERIC(39, 0),
    gross_amount NUMERIC(39, 0),
    has_cost_line VARCHAR(3),
    is_cost_line VARCHAR(3),
    is_custom_line VARCHAR(3),
    is_exclude_from_rate_request VARCHAR(3),
    is_item_value_adjustment VARCHAR(3),
    isbillable VARCHAR(3),
    iscleared VARCHAR(3),
    isnonreimbursable VARCHAR(3),
    istaxable VARCHAR(3),
    item_count NUMERIC(18, 8),
    item_id NUMERIC(39, 0),
    item_received VARCHAR(3),
    item_unit_price VARCHAR(42),
    kit_part_number NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    net_amount NUMERIC(39, 0),
    non_posting_line VARCHAR(3),
    number_billed NUMERIC(18, 8),
    number_revenue_committed NUMERIC(18, 8),
    opportunity_discount_line VARCHAR(3),
    opportunity_id NUMERIC(39, 0),
    opportunity_line_id NUMERIC(39, 0),
    opportunity_order NUMERIC(39, 0),
    payment_method_id NUMERIC(39, 0),
    payroll_item_id NUMERIC(39, 0),
    payroll_wage_base_amount NUMERIC(20, 2),
    payroll_year_to_date_amount NUMERIC(20, 2),
    period_closed TIMESTAMP,
    price_type_id NUMERIC(39, 0),
    quantity_received_in_shipment NUMERIC(18, 8),
    receivebydate TIMESTAMP,
    reimbursement_type VARCHAR(128),
    related_company_id NUMERIC(39, 0),
    shipdate TIMESTAMP,
    shipment_received TIMESTAMP,
    subsidiary_id NUMERIC(39, 0),
    tax_item_id NUMERIC(39, 0),
    tax_type VARCHAR(64),
    tobeemailed VARCHAR(3),
    tobefaxed VARCHAR(3),
    tobeprinted VARCHAR(3),
    PRIMARY KEY (opportunity_id, opportunity_line_id)
);

CREATE TABLE Opportunitycontactmap (
    contact_id NUMERIC(39, 0),
    contactrole_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    opportunity_id NUMERIC(39, 0),
    PRIMARY KEY (contact_id, opportunity_id)
);

CREATE TABLE Originating_leads (
    accountnumber VARCHAR(99),
    altemail VARCHAR(254),
    alternate_contact_id NUMERIC(39, 0),
    altphone VARCHAR(100),
    amount_complete NUMERIC(5, 2),
    billaddress VARCHAR(999),
    calculated_end TIMESTAMP,
    category_0 VARCHAR(30),
    city VARCHAR(50),
    comments VARCHAR(4000),
    companyname VARCHAR(83),
    consol_days_overdue NUMERIC(39, 0),
    consol_deposit_balance NUMERIC(39, 0),
    consol_deposit_balance_foreign NUMERIC(39, 0),
    consol_openbalance NUMERIC(39, 0),
    consol_openbalance_foreign NUMERIC(39, 0),
    consol_unbilled_orders NUMERIC(39, 0),
    consol_unbilled_orders_foreign NUMERIC(39, 0),
    converted_to_contact_id NUMERIC(39, 0),
    converted_to_id NUMERIC(39, 0),
    cost_estimate NUMERIC(25, 5),
    country VARCHAR(50),
    create_date TIMESTAMP,
    credithold VARCHAR(4),
    creditlimit NUMERIC(20, 2),
    currency_id NUMERIC(39, 0),
    customer_id NUMERIC(39, 0) PRIMARY KEY,
    customer_type_id NUMERIC(39, 0),
    date_closed TIMESTAMP,
    date_convsersion TIMESTAMP,
    date_first_order TIMESTAMP,
    date_first_sale TIMESTAMP,
    date_gross_lead TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_last_order TIMESTAMP,
    date_last_sale TIMESTAMP,
    date_lead TIMESTAMP,
    date_prospect TIMESTAMP,
    days_overdue NUMERIC(39, 0),
    default_order_priority NUMERIC(20, 2),
    default_receivables_account_id NUMERIC(39, 0),
    deposit_balance NUMERIC(20, 2),
    deposit_balance_foreign NUMERIC(39, 0),
    email VARCHAR(254),
    expected_close TIMESTAMP,
    fax VARCHAR(100),
    first_sale_period_id NUMERIC(39, 0),
    first_visit TIMESTAMP,
    firstname VARCHAR(32),
    full_name VARCHAR(1800),
    home_phone VARCHAR(100),
    is_exempt_time VARCHAR(3),
    is_explicit_conversion VARCHAR(3),
    is_job VARCHAR(3),
    is_person VARCHAR(3),
    is_productive_time VARCHAR(3),
    is_utilized_time VARCHAR(3),
    isemailhtml VARCHAR(3),
    isemailpdf VARCHAR(3),
    isinactive VARCHAR(3),
    istaxable VARCHAR(3),
    job_end TIMESTAMP,
    job_start TIMESTAMP,
    job_type_id NUMERIC(39, 0),
    last_modified_date TIMESTAMP,
    last_sale_period_id NUMERIC(39, 0),
    last_visit TIMESTAMP,
    lastname VARCHAR(32),
    lead_source_id NUMERIC(39, 0),
    line1 VARCHAR(150),
    line2 VARCHAR(150),
    line3 VARCHAR(150),
    loginaccess VARCHAR(3),
    middlename VARCHAR(32),
    mobile_phone VARCHAR(100),
    multiple_price_id NUMERIC(39, 0),
    name VARCHAR(83),
    openbalance NUMERIC(39, 0),
    openbalance_foreign NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    partner_id NUMERIC(39, 0),
    payment_terms_id NUMERIC(39, 0),
    phone VARCHAR(100),
    primary_contact_id NUMERIC(39, 0),
    print_on_check_as VARCHAR(83),
    probability NUMERIC(6, 2),
    projected_end TIMESTAMP,
    referrer VARCHAR(4000),
    reminderdays NUMERIC(39, 0),
    renewal TIMESTAMP,
    resalenumber VARCHAR(20),
    rev_rec_forecast_rule_id NUMERIC(39, 0),
    rev_rec_forecast_template NUMERIC(39, 0),
    revenue_estimate NUMERIC(25, 5),
    sales_rep_id NUMERIC(39, 0),
    sales_territory_id NUMERIC(39, 0),
    salutation VARCHAR(30),
    ship_complete VARCHAR(3),
    shipaddress VARCHAR(999),
    state VARCHAR(50),
    status VARCHAR(199),
    status_descr VARCHAR(199),
    status_probability NUMERIC(6, 2),
    status_read_only VARCHAR(3),
    subsidiary_id NUMERIC(39, 0),
    tax_item_id NUMERIC(39, 0),
    third_party_acct VARCHAR(32),
    third_party_carrier VARCHAR(64),
    third_party_country VARCHAR(6),
    third_party_zip_code VARCHAR(10),
    top_level_parent_id NUMERIC(39, 0),
    unbilled_orders NUMERIC(20, 2),
    unbilled_orders_foreign NUMERIC(39, 0),
    url VARCHAR(100),
    use_percent_complete_override VARCHAR(3),
    web_lead VARCHAR(3),
    zipcode VARCHAR(36)
);

CREATE TABLE Other_names (
    account_number VARCHAR(99),
    address VARCHAR(999),
    address1 VARCHAR(150),
    address2 VARCHAR(150),
    address3 VARCHAR(150),
    altemail VARCHAR(254),
    altphone VARCHAR(100),
    city VARCHAR(50),
    comments VARCHAR(4000),
    companyname VARCHAR(83),
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    email VARCHAR(254),
    fax VARCHAR(100),
    full_name VARCHAR(1800),
    home_phone VARCHAR(100),
    is_person VARCHAR(3),
    isinactive VARCHAR(3),
    last_modified_date TIMESTAMP,
    loginaccess VARCHAR(3),
    mobile_phone VARCHAR(100),
    name VARCHAR(83),
    other_name_extid VARCHAR(255),
    other_name_id NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    phone VARCHAR(100),
    state VARCHAR(50),
    subsidiary NUMERIC(39, 0),
    url VARCHAR(100),
    zipcode VARCHAR(36)
);

CREATE TABLE Partners (
    account_number VARCHAR(99),
    address VARCHAR(999),
    address1 VARCHAR(150),
    address2 VARCHAR(150),
    address3 VARCHAR(150),
    altemail VARCHAR(254),
    altphone VARCHAR(100),
    assigntasks VARCHAR(3),
    city VARCHAR(50),
    code VARCHAR(200),
    comments VARCHAR(4000),
    companyname VARCHAR(83),
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    email VARCHAR(254),
    fax VARCHAR(100),
    full_name VARCHAR(1800),
    home_phone VARCHAR(100),
    is_person VARCHAR(3),
    isinactive VARCHAR(3),
    last_modified_date TIMESTAMP,
    loginaccess VARCHAR(3),
    mobile_phone VARCHAR(100),
    name VARCHAR(83),
    partner_extid VARCHAR(255),
    partner_id NUMERIC(39, 0) PRIMARY KEY,
    phone VARCHAR(100),
    print_on_check_as VARCHAR(83),
    shipping_address VARCHAR(999),
    state VARCHAR(50),
    subsidiary NUMERIC(39, 0),
    tax_number VARCHAR(15),
    url VARCHAR(100),
    zipcode VARCHAR(36)
);

CREATE TABLE Partner_sales_roles (
    date_last_modified TIMESTAMP,
    isinactive VARCHAR(3),
    name VARCHAR(31),
    parent_id NUMERIC(39, 0),
    partner_sales_role_extid VARCHAR(255),
    partner_sales_role_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Partner_types (
    date_last_modified TIMESTAMP,
    isinactive VARCHAR(3),
    name VARCHAR(31),
    parent_id NUMERIC(39, 0),
    partner_id NUMERIC(39, 0),
    partner_type_extid VARCHAR(255),
    partner_type_id NUMERIC(39, 0)
);

CREATE TABLE Payment_terms (
    date_driven VARCHAR(3),
    date_last_modified TIMESTAMP,
    days_till_1st_payment NUMERIC(39, 0),
    days_until_due NUMERIC(39, 0),
    discount_days NUMERIC(39, 0),
    frequency_id VARCHAR(20),
    installment_count NUMERIC(39, 0),
    is_installment VARCHAR(3),
    is_preferred VARCHAR(1),
    is_split_evenly VARCHAR(3),
    isinactive VARCHAR(3),
    minimum_days NUMERIC(39, 0),
    name VARCHAR(31),
    payment_terms_extid VARCHAR(255),
    payment_terms_id NUMERIC(39, 0) PRIMARY KEY,
    percentage_discount NUMERIC(10, 5),
    repeat_every NUMERIC(39, 0)
);

CREATE TABLE Payment_methods (
    date_last_modified TIMESTAMP,
    default_account_id NUMERIC(39, 0),
    external_0 VARCHAR(3),
    isinactive VARCHAR(3),
    name VARCHAR(31),
    payment_method_extid VARCHAR(255),
    payment_method_id NUMERIC(39, 0) PRIMARY KEY,
    payment_method_tags VARCHAR(256)
);

CREATE TABLE Payroll_item_types (
    name VARCHAR(50),
    parent_id NUMERIC(39, 0),
    payroll_item_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Payroll_items (
    date_last_modified TIMESTAMP,
    derived_from_payroll_item_id NUMERIC(39, 0),
    derived_rate_multiplier NUMERIC(15, 8),
    expense_account NUMERIC(39, 0),
    isinactive VARCHAR(3),
    liability_account NUMERIC(39, 0),
    limit_0 NUMERIC(12, 2),
    locality VARCHAR(15),
    name VARCHAR(50),
    payroll_item_id NUMERIC(39, 0) PRIMARY KEY,
    payroll_item_type_id NUMERIC(39, 0),
    rate VARCHAR(42),
    state VARCHAR(2),
    tax_number VARCHAR(20),
    vendor_id NUMERIC(39, 0),
    w2_code VARCHAR(10)
);

CREATE TABLE Percent_complete_overrides (
    accounting_period_id NUMERIC(39, 0),
    comments VARCHAR(99),
    percent_complete NUMERIC(39, 0)
);

CREATE TABLE Planassignmap (
    date_created TIMESTAMP,
    employee_id NUMERIC(39, 0),
    end_date TIMESTAMP,
    plan_id NUMERIC(39, 0),
    start_date TIMESTAMP,
    PRIMARY KEY (employee_id, plan_id, start_date)
);

CREATE TABLE Planned_standard_costs (
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    planned_standard_cost_id NUMERIC(39, 0) PRIMARY KEY,
    standard_cost_version_id NUMERIC(39, 0)
);

CREATE TABLE Planschedulemap (
    date_created TIMESTAMP,
    plan_id NUMERIC(39, 0),
    schedule_id NUMERIC(39, 0),
    PRIMARY KEY (plan_id, schedule_id)
);

CREATE TABLE Posting_account_activity (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    activity_date TIMESTAMP,
    amount NUMERIC(25, 2),
    amount_foreign NUMERIC(25, 2),
    class_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    partner_id NUMERIC(39, 0),
    promotion_code_id NUMERIC(39, 0),
    quantity NUMERIC(25, 8),
    sales_rep_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Posting_account_activity_pe (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    activity_date TIMESTAMP,
    amount NUMERIC(25, 2),
    amount_foreign NUMERIC(25, 2),
    balance_from_subsidiary_id NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    partner_id NUMERIC(39, 0),
    promotion_code_id NUMERIC(39, 0),
    quantity NUMERIC(25, 8),
    sales_rep_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Price_book_line_intervals (
    charge_frequency_id VARCHAR(20),
    discount NUMERIC(39, 0),
    is_discount_percentage VARCHAR(3),
    is_overage_discount_percentage VARCHAR(3),
    overage_charge_frequency_id VARCHAR(20),
    overage_discount NUMERIC(39, 0),
    overage_price_plan_id NUMERIC(39, 0),
    overage_repeat_every NUMERIC(39, 0),
    pbli_id NUMERIC(39, 0) PRIMARY KEY,
    plan_line_id NUMERIC(39, 0),
    plan_line_number NUMERIC(39, 0),
    price_book_id NUMERIC(39, 0),
    price_plan_id NUMERIC(39, 0),
    prorate_by VARCHAR(10),
    repeat_every NUMERIC(39, 0),
    start_offset VARCHAR(70),
    usage_multiplier_line_id NUMERIC(39, 0)
);

CREATE TABLE Price_tiers (
    from_quantity NUMERIC(39, 0),
    maximum_quantity NUMERIC(20, 2),
    minimum_quantity NUMERIC(20, 2),
    price_plan_id NUMERIC(39, 0),
    price_tier VARCHAR(45),
    price_tier_id NUMERIC(39, 0) PRIMARY KEY,
    price_value NUMERIC(39, 0),
    pricing_option VARCHAR(200)
);

CREATE TABLE Price_types (
    date_last_modified TIMESTAMP,
    discount_percentage NUMERIC(5, 2),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    name VARCHAR(60),
    price_type_extid VARCHAR(255),
    price_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Price_books (
    currency VARCHAR(4),
    name VARCHAR(32),
    plan_id NUMERIC(39, 0),
    price_book_extid VARCHAR(255),
    price_book_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Price_plans (
    currency VARCHAR(4),
    date_created TIMESTAMP,
    included_quantity NUMERIC(18, 8),
    price_plan_extid VARCHAR(255),
    price_plan_id NUMERIC(39, 0) PRIMARY KEY,
    price_plan_type VARCHAR(50)
);

CREATE TABLE Pricing_groups (
    name VARCHAR(60),
    pricing_group_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Project_billing_budgets (
    amount NUMERIC(20, 2),
    is_calculated VARCHAR(3),
    month_end TIMESTAMP,
    month_start TIMESTAMP,
    project_cost_category_id NUMERIC(39, 0),
    project_id NUMERIC(39, 0)
);

CREATE TABLE Project_cost_budgets (
    amount NUMERIC(20, 2),
    is_calculated VARCHAR(3),
    is_calculated_from_allocations VARCHAR(3),
    month_end TIMESTAMP,
    month_start TIMESTAMP,
    project_cost_category_id NUMERIC(39, 0),
    project_id NUMERIC(39, 0)
);

CREATE TABLE Project_cost_categories (
    category_name VARCHAR(4000),
    category_type VARCHAR(10),
    expense_category_id NUMERIC(39, 0),
    full_name VARCHAR(4000),
    is_other_category VARCHAR(3),
    is_selected VARCHAR(3),
    project_cost_category_id NUMERIC(39, 0) PRIMARY KEY,
    service_item_id NUMERIC(39, 0),
    supplier_category_id VARCHAR(32),
    use_subcategories VARCHAR(3)
);

CREATE TABLE Project_revenue_rl_plans (
    date_recognized TIMESTAMP,
    fixed_amount NUMERIC(20, 2),
    percent_from_total NUMERIC(12, 4),
    project_revenue_rl_plan_id NUMERIC(39, 0) PRIMARY KEY,
    project_revenue_rule_id NUMERIC(39, 0),
    project_task_id NUMERIC(39, 0)
);

CREATE TABLE Project_revenue_rls_charge_rls (
    actual_amount NUMERIC(23, 5),
    charge_rule_id NUMERIC(39, 0),
    date_amount_modified TIMESTAMP,
    forecast_amount NUMERIC(23, 5),
    project_revenue_rule_id NUMERIC(39, 0),
    PRIMARY KEY (charge_rule_id, project_revenue_rule_id)
);

CREATE TABLE Project_revenue_rules (
    billing_rate_card_id NUMERIC(39, 0),
    created_by NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(4000),
    fixed_amount_type VARCHAR(20),
    fixed_schedule_type VARCHAR(10),
    is_inactive VARCHAR(3),
    is_revenue_reconciled VARCHAR(3),
    last_modified_by NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    project_revenue_rule_extid VARCHAR(255),
    project_revenue_rule_id NUMERIC(39, 0) PRIMARY KEY,
    rate_multiplier NUMERIC(12, 3),
    rate_source_type_id VARCHAR(10),
    recurrence_end_date TIMESTAMP,
    recurrence_frequency VARCHAR(4000),
    recurrence_period NUMERIC(39, 0),
    recurrence_start_date TIMESTAMP,
    rounding_type_id VARCHAR(10),
    rule_name VARCHAR(200),
    rule_type_id VARCHAR(20),
    saved_search_id NUMERIC(39, 0),
    service_item_id NUMERIC(39, 0)
);

CREATE TABLE Project_task_billing_budgets (
    amount NUMERIC(20, 2),
    is_calculated VARCHAR(3),
    month_end TIMESTAMP,
    month_start TIMESTAMP,
    project_cost_category_id NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    project_task_id NUMERIC(39, 0)
);

CREATE TABLE Project_task_cost_budgets (
    amount NUMERIC(20, 2),
    is_calculated VARCHAR(3),
    month_end TIMESTAMP,
    month_start TIMESTAMP,
    project_cost_category_id NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    project_task_id NUMERIC(39, 0)
);

CREATE TABLE Project_task_dependencies (
    dependency_type VARCHAR(2),
    lag_days NUMERIC(39, 0),
    predecessor_task_id NUMERIC(39, 0),
    successor_task_id NUMERIC(39, 0)
);

CREATE TABLE Project_time_approval_types (
    description VARCHAR(4000),
    project_time_approval_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Project_expense_types (
    account_id NUMERIC(39, 0),
    description VARCHAR(2000),
    is_inactive VARCHAR(3),
    name VARCHAR(200),
    project_expense_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Project_tasks (
    actual_work NUMERIC(39, 0),
    allocated_work NUMERIC(39, 0),
    assigned_id NUMERIC(39, 0),
    calculated_work NUMERIC(39, 0),
    calculated_work_baseline NUMERIC(39, 0),
    constraint_type VARCHAR(15),
    date_last_modified TIMESTAMP,
    due_date TIMESTAMP,
    end_date TIMESTAMP,
    end_date_baseline TIMESTAMP,
    estimated_cost NUMERIC(39, 0),
    estimated_cost_baseline NUMERIC(39, 0),
    estimated_cost_baseline_frn NUMERIC(39, 0),
    estimated_cost_foreign NUMERIC(39, 0),
    estimated_work NUMERIC(39, 0),
    estimated_work_baseline NUMERIC(39, 0),
    finish_by_date TIMESTAMP,
    is_milestone VARCHAR(1),
    is_non_billable VARCHAR(3),
    is_on_critical_path VARCHAR(3),
    is_summary_task VARCHAR(3),
    isinactive VARCHAR(3),
    message VARCHAR(4000),
    name VARCHAR(256),
    owner_id NUMERIC(39, 0),
    parent_task_id NUMERIC(39, 0),
    percent_complete NUMERIC(39, 0),
    percent_complete_by_allocation NUMERIC(39, 0),
    planned_work NUMERIC(39, 0),
    planned_work_baseline NUMERIC(39, 0),
    priority VARCHAR(32),
    project_id NUMERIC(39, 0),
    projecttask_extid VARCHAR(255),
    projecttask_id NUMERIC(39, 0),
    slack_minutes NUMERIC(39, 0),
    start_date TIMESTAMP,
    start_date_0 TIMESTAMP,
    start_date_baseline TIMESTAMP,
    status VARCHAR(64),
    taskorder NUMERIC(39, 0),
    use_calculated_billing_budget VARCHAR(3),
    use_calculated_cost_budget VARCHAR(3)
);

CREATE TABLE Project_task_assignments (
    allocated_work NUMERIC(39, 0),
    billing_class_id NUMERIC(39, 0),
    calculated_work NUMERIC(39, 0),
    estimated_work NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    planned_work NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    project_task_id NUMERIC(39, 0),
    resource_id NUMERIC(39, 0),
    unit_cost NUMERIC(39, 0),
    unit_cost_foreign NUMERIC(39, 0),
    unit_price NUMERIC(39, 0),
    unit_price_foreign NUMERIC(39, 0),
    units NUMERIC(39, 0)
);

CREATE TABLE Project_templates (
    billing_rate_card_id NUMERIC(39, 0),
    billing_schedule_type VARCHAR(60),
    date_scheduled_end TIMESTAMP,
    date_template_start TIMESTAMP,
    is_inactive VARCHAR(3),
    is_limit_time_to_assignees VARCHAR(3),
    is_source_item_from_brc VARCHAR(3),
    project_expense_type_id NUMERIC(39, 0),
    project_manager_id NUMERIC(39, 0),
    scheduling_method_id VARCHAR(15),
    template_id NUMERIC(39, 0),
    template_name VARCHAR(83),
    use_budget_from_allocations VARCHAR(3),
    use_calculated_billing_budget VARCHAR(3),
    use_calculated_cost_budget VARCHAR(3)
);

CREATE TABLE Promotion_codes (
    apply_discount VARCHAR(20),
    code VARCHAR(120),
    code_pattern VARCHAR(120),
    date_last_modified TIMESTAMP,
    descr VARCHAR(199),
    discount VARCHAR(42),
    discount_id NUMERIC(39, 0),
    display_line_discounts VARCHAR(3),
    end_date TIMESTAMP,
    name VARCHAR(120),
    plugin_implementation_id VARCHAR(200),
    promotion_code_id NUMERIC(39, 0) PRIMARY KEY,
    use_type VARCHAR(12)
);

CREATE TABLE Purchase_charge_rules (
    cap NUMERIC(12, 3),
    charge_rule_id NUMERIC(39, 0) PRIMARY KEY,
    charge_rule_type_id VARCHAR(32),
    charge_stage_id VARCHAR(32),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(4000),
    mark_up_item_id NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    purchase_charge_rule_extid VARCHAR(255),
    purchase_saved_search_id NUMERIC(39, 0),
    rate_multiplier NUMERIC(12, 3),
    rule_name VARCHAR(200),
    rule_order NUMERIC(39, 0)
);

CREATE TABLE Quota1 (
    amount NUMERIC(20, 2),
    class_0 NUMERIC(39, 0),
    date_0 TIMESTAMP,
    department NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    is_alt_sales VARCHAR(1),
    item NUMERIC(39, 0),
    location_0 NUMERIC(39, 0),
    period NUMERIC(39, 0),
    quarterly_amount NUMERIC(20, 2),
    quota_id NUMERIC(39, 0) PRIMARY KEY,
    subsidiary NUMERIC(39, 0),
    team_quota VARCHAR(1)
);

CREATE TABLE Resource_group_entity_map (
    entity_id NUMERIC(39, 0),
    group_id NUMERIC(39, 0),
    PRIMARY KEY (entity_id, group_id)
);

CREATE TABLE Resource_groups (
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(2000),
    is_inactive VARCHAR(3),
    resource_group_extid VARCHAR(255),
    resource_group_id NUMERIC(39, 0) PRIMARY KEY,
    resource_group_name VARCHAR(83)
);

CREATE TABLE Resource_allocations (
    allocation_type VARCHAR(200),
    allocation_unit VARCHAR(1),
    customer_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    end_date TIMESTAMP,
    is_inactive VARCHAR(3),
    notes VARCHAR(4000),
    num_hours NUMERIC(10, 4),
    num_percent NUMERIC(12, 4),
    project_id NUMERIC(39, 0),
    project_task_id NUMERIC(39, 0),
    requestor_id NUMERIC(39, 0),
    resource_allocation_extid VARCHAR(255),
    resource_allocation_id NUMERIC(39, 0),
    resource_id NUMERIC(39, 0),
    start_date TIMESTAMP
);

CREATE TABLE Revaluation (
    account_id NUMERIC(39, 0),
    balance NUMERIC(39, 0),
    curr_fx_rate NUMERIC(30, 15),
    currency_id NUMERIC(39, 0),
    entity_id NUMERIC(39, 0),
    fx_balance NUMERIC(21, 3),
    is_tax_reg_override VARCHAR(3),
    legal_name VARCHAR(400),
    net_variance NUMERIC(20, 2),
    prior_variance NUMERIC(39, 0),
    promotion_code_instance_id NUMERIC(39, 0),
    reval_class NUMERIC(39, 0),
    reval_department NUMERIC(39, 0),
    reval_line_id NUMERIC(39, 0),
    reval_location NUMERIC(39, 0),
    reval_memo VARCHAR(4000),
    reval_tran_id NUMERIC(39, 0),
    reval_tran_period_id NUMERIC(39, 0),
    reval_type VARCHAR(24),
    subsidiary_id NUMERIC(39, 0),
    tax_reg_id NUMERIC(39, 0),
    total_variance NUMERIC(39, 0),
    tran_date TIMESTAMP,
    tran_fx_rate NUMERIC(30, 15),
    tran_id NUMERIC(39, 0),
    variance NUMERIC(20, 2),
    variance_account_id NUMERIC(39, 0)
);

CREATE TABLE Revenue_elements (
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    allocated_contract_cost_amount NUMERIC(20, 2),
    allocation_amount NUMERIC(20, 2),
    allocation_amount_foreign NUMERIC(20, 2),
    allocation_type VARCHAR(128),
    alternate_quantity NUMERIC(39, 0),
    alternate_unit_id NUMERIC(39, 0),
    amortization_end_date TIMESTAMP,
    amortization_schedule_id NUMERIC(39, 0),
    amortization_start_date TIMESTAMP,
    amortization_template_id NUMERIC(39, 0),
    calculated_amount NUMERIC(20, 2),
    calculated_amount_foreign NUMERIC(20, 2),
    class_id NUMERIC(39, 0),
    contract_cost_allocation_pct NUMERIC(39, 0),
    contract_exp_offset_acct_id NUMERIC(39, 0),
    contract_expense_account_id NUMERIC(39, 0),
    cost_amortization_amount NUMERIC(20, 2),
    create_plan_on_event_type VARCHAR(128),
    currency_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    deferral_account_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    disc_sales_amount_foreign NUMERIC(20, 2),
    discounted_sales_amount NUMERIC(20, 2),
    end_date TIMESTAMP,
    entity_id NUMERIC(39, 0),
    exchange_rate NUMERIC(30, 15),
    expense_migrate_adjust_acct_id NUMERIC(39, 0),
    fair_value NUMERIC(30, 15),
    fair_value_foreign NUMERIC(30, 15),
    forecast_end_date TIMESTAMP,
    forecast_start_date TIMESTAMP,
    fx_adjustment_account_id NUMERIC(39, 0),
    is_bom_item_type VARCHAR(3),
    is_fair_value_override VARCHAR(3),
    is_fair_value_vsoe VARCHAR(3),
    is_hold_rev_rec VARCHAR(3),
    is_permit_discount VARCHAR(3),
    is_posting_discount_applied VARCHAR(3),
    item_id NUMERIC(39, 0),
    item_labor_cost_amount NUMERIC(20, 2),
    item_resale_cost_amount NUMERIC(20, 2),
    labor_deferred_expense_acct_id NUMERIC(39, 0),
    labor_expense_acct_id NUMERIC(39, 0),
    last_merge_from_arrangement_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    new_standard_migrate_date TIMESTAMP,
    parent_bom_element_id NUMERIC(39, 0),
    pending_action VARCHAR(250),
    quantity NUMERIC(18, 8),
    recognition_account_id NUMERIC(39, 0),
    reference_id VARCHAR(4000),
    return_revenue_element_id NUMERIC(39, 0),
    rev_rec_forecast_rule_id NUMERIC(39, 0),
    rev_rec_rule_id NUMERIC(39, 0),
    revenue_allocation_group VARCHAR(60),
    revenue_allocation_ratio NUMERIC(39, 0),
    revenue_element_id NUMERIC(39, 0) PRIMARY KEY,
    revenue_element_number VARCHAR(99),
    revenue_migrate_adjust_acct_id NUMERIC(39, 0),
    sales_amount NUMERIC(20, 2),
    sales_amount_foreign NUMERIC(20, 2),
    source_date TIMESTAMP,
    source_id NUMERIC(39, 0),
    source_transaction_id NUMERIC(39, 0),
    source_type VARCHAR(250),
    start_date TIMESTAMP,
    subscription_line NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    term_in_days NUMERIC(39, 0),
    term_in_months NUMERIC(39, 0),
    unbilled_receivable_group VARCHAR(60)
);

CREATE TABLE Revenue_plan_lines (
    accounting_period_id NUMERIC(39, 0),
    amount NUMERIC(20, 2),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    deferral_account_id NUMERIC(39, 0),
    is_recognized VARCHAR(3),
    journal_id NUMERIC(39, 0),
    plan_id NUMERIC(39, 0),
    planned_revenue_type VARCHAR(250),
    recognition_account_id NUMERIC(39, 0)
);

CREATE TABLE Revenue_plan_version_lines (
    accounting_period_id NUMERIC(39, 0),
    amount NUMERIC(20, 2),
    comments VARCHAR(200),
    date_created TIMESTAMP,
    deferral_account_id NUMERIC(39, 0),
    journal_id NUMERIC(39, 0),
    plan_version_id NUMERIC(39, 0),
    planned_revenue_type VARCHAR(250),
    recognition_account_id NUMERIC(39, 0)
);

CREATE TABLE Revenue_plan_versions (
    created_by_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    plan_id NUMERIC(39, 0),
    plan_version NUMERIC(39, 0),
    plan_version_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Revenue_recognition_rules (
    amount_source VARCHAR(150),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    end_date_change_impact VARCHAR(150),
    end_date_source VARCHAR(150),
    initial_amount VARCHAR(42),
    name VARCHAR(99),
    period_offset NUMERIC(39, 0),
    recognition_period NUMERIC(39, 0),
    reforecast_method VARCHAR(150),
    rev_rec_rule_id NUMERIC(39, 0) PRIMARY KEY,
    rule_method VARCHAR(150),
    start_date_source VARCHAR(150),
    start_offset NUMERIC(39, 0),
    term_in_days NUMERIC(39, 0),
    term_in_months NUMERIC(39, 0)
);

CREATE TABLE Revenue_plans (
    accounting_period_id NUMERIC(39, 0),
    comments VARCHAR(500),
    created_from VARCHAR(4000),
    creation_triggered_by VARCHAR(4000),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    end_date TIMESTAMP,
    is_hold_rev_rec VARCHAR(3),
    plan_id NUMERIC(39, 0) PRIMARY KEY,
    plan_number VARCHAR(99),
    reforecast_method VARCHAR(150),
    rev_rec_rule_id NUMERIC(39, 0),
    revenue_element_id NUMERIC(39, 0),
    revenue_plan_status VARCHAR(128),
    revenue_plan_type VARCHAR(128),
    start_date TIMESTAMP
);

CREATE TABLE Revrecschedules (
    amount NUMERIC(20, 2),
    initial_amount VARCHAR(42),
    is_template VARCHAR(1),
    name VARCHAR(40),
    period_offset NUMERIC(10, 0),
    schedule_id NUMERIC(39, 0) PRIMARY KEY,
    schedule_method VARCHAR(56),
    schedule_number VARCHAR(99),
    schedule_type VARCHAR(8),
    start_offset NUMERIC(39, 0),
    term_source VARCHAR(49)
);

CREATE TABLE Revrecschedulelines (
    account_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    amount VARCHAR(42),
    is_recognized VARCHAR(3),
    journal_id NUMERIC(39, 0),
    schedule_id NUMERIC(39, 0)
);

CREATE TABLE Roles1 (
    center_created_by NUMERIC(39, 0),
    center_created_date TIMESTAMP,
    center_id VARCHAR(128),
    center_modified_by NUMERIC(39, 0),
    center_modified_date TIMESTAMP,
    center_name VARCHAR(128),
    class_restriction_type VARCHAR(16),
    custom_record_permission_name VARCHAR(4000),
    date_last_modified TIMESTAMP,
    department_restriction_type VARCHAR(16),
    employee_restriction_type VARCHAR(16),
    is_classallowviewing VARCHAR(3),
    is_departmentallowviewing VARCHAR(3),
    is_employeeallowviewing VARCHAR(3),
    is_inactive VARCHAR(3),
    is_itemclassrestricted VARCHAR(3),
    is_itemdepartmentrestricted VARCHAR(3),
    is_itemlocationtrestricted VARCHAR(3),
    is_locationallowviewing VARCHAR(3),
    is_subsidiaryallowviewing VARCHAR(3),
    location_restriction_type VARCHAR(16),
    permission_id VARCHAR(30),
    permission_level_id NUMERIC(39, 0),
    permission_level_name VARCHAR(64),
    permission_name VARCHAR(200),
    permsofroles_date_modified TIMESTAMP,
    permsofroles_modified_by NUMERIC(39, 0),
    role_created_by NUMERIC(39, 0),
    role_created_date TIMESTAMP,
    role_id NUMERIC(39, 0),
    role_modified_by NUMERIC(39, 0),
    role_name VARCHAR(999)
);

CREATE TABLE Role_subsidiary_map (
    role_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (role_id, subsidiary_id)
);

CREATE TABLE Sales_reps (
    account_number VARCHAR(4000),
    address VARCHAR(999),
    address1 VARCHAR(150),
    address2 VARCHAR(150),
    address3 VARCHAR(150),
    approval_limit NUMERIC(20, 2),
    approver_id NUMERIC(39, 0),
    birthdate TIMESTAMP,
    city VARCHAR(50),
    class_id NUMERIC(39, 0),
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    def_acct_corp_card_expenses_id NUMERIC(39, 0),
    def_expense_report_currency_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    email VARCHAR(254),
    employee_type_id NUMERIC(39, 0),
    firstname VARCHAR(32),
    full_name VARCHAR(1800),
    identification_number VARCHAR(11),
    initials VARCHAR(3),
    isinactive VARCHAR(3),
    lastname VARCHAR(32),
    loginaccess VARCHAR(3),
    midname VARCHAR(32),
    name VARCHAR(83),
    notes VARCHAR(4000),
    phone VARCHAR(100),
    sales_rep_extid VARCHAR(255),
    sales_rep_id NUMERIC(39, 0) PRIMARY KEY,
    sales_role_id NUMERIC(39, 0),
    salutation VARCHAR(30),
    state VARCHAR(50),
    subsidiary_id NUMERIC(39, 0),
    supervisor_id NUMERIC(39, 0),
    zipcode VARCHAR(36)
);

CREATE TABLE Sales_territories (
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    isinactive VARCHAR(3),
    name VARCHAR(50),
    priority NUMERIC(39, 0),
    sales_territory_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Salesforecast (
    calculated_amount NUMERIC(20, 2),
    date_entered TIMESTAMP,
    forecast_amount NUMERIC(20, 2),
    forecast_date TIMESTAMP,
    forecast_id NUMERIC(39, 0) PRIMARY KEY,
    high_calculated_amount NUMERIC(20, 2),
    high_forecasted_amount NUMERIC(20, 2),
    is_alt_sales VARCHAR(1),
    low_calculated_amount NUMERIC(20, 2),
    low_forecasted_amount NUMERIC(20, 2),
    manager_override VARCHAR(1),
    modified_by_id NUMERIC(39, 0),
    pipeline_amount NUMERIC(20, 2),
    salesrep_id NUMERIC(39, 0),
    subsidiary NUMERIC(39, 0),
    team_forecast VARCHAR(1)
);

CREATE TABLE Sales_roles (
    date_last_modified TIMESTAMP,
    description VARCHAR(999),
    is_inactive VARCHAR(3),
    is_sales_rep_role VARCHAR(3),
    name VARCHAR(50),
    sales_role_extid VARCHAR(255),
    sales_role_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Service_items (
    cost_0 NUMERIC(30, 15),
    cost_category VARCHAR(50),
    create_plan_on_event_type VARCHAR(128),
    created TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_of_last_transaction TIMESTAMP,
    description VARCHAR(4000),
    displayname VARCHAR(4000),
    expense_account_id NUMERIC(39, 0),
    featureddescription VARCHAR(65534),
    full_name VARCHAR(550),
    fx_adjustment_account_id NUMERIC(39, 0),
    include_child_subsidiaries VARCHAR(3),
    income_account_id NUMERIC(39, 0),
    interco_expense_account_id NUMERIC(39, 0),
    interco_income_account_id NUMERIC(39, 0),
    is_moss VARCHAR(3),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    istaxable VARCHAR(3),
    item_extid VARCHAR(255),
    item_id NUMERIC(39, 0) PRIMARY KEY,
    item_revenue_category VARCHAR(250),
    manufacturing_charge_item VARCHAR(3),
    matrix_type VARCHAR(6),
    modified TIMESTAMP,
    name VARCHAR(250),
    offersupport VARCHAR(3),
    onspecial VARCHAR(3),
    parent_id NUMERIC(39, 0),
    payment_method_id NUMERIC(39, 0),
    pref_purchase_tax_id NUMERIC(39, 0),
    pref_sale_tax_id NUMERIC(39, 0),
    prices_include_tax VARCHAR(1),
    print_sub_items VARCHAR(3),
    purchasedescription VARCHAR(4000),
    rate VARCHAR(42),
    rev_rec_forecast_rule_id NUMERIC(39, 0),
    rev_rec_rule_id NUMERIC(39, 0),
    revenue_allocation_group VARCHAR(60),
    specialsdescription VARCHAR(65534),
    storedescription VARCHAR(4000),
    storedetaileddescription VARCHAR(65534),
    storedisplayname VARCHAR(4000),
    subtype VARCHAR(10),
    upc_code VARCHAR(180),
    vendor_id NUMERIC(39, 0),
    vendorname VARCHAR(250),
    vsoe_deferral VARCHAR(28),
    vsoe_delivered VARCHAR(3),
    vsoe_discount VARCHAR(12),
    vsoe_price NUMERIC(30, 15)
);

CREATE TABLE Shipment_packages (
    admissibility_package_type VARCHAR(128),
    alcohol_recipient_type VARCHAR(32),
    authorization_number VARCHAR(64),
    carrier_packaging VARCHAR(128),
    cash_on_delivery_amount NUMERIC(39, 0),
    cash_on_delivery_method VARCHAR(128),
    cod_other_charge NUMERIC(39, 0),
    contents_description VARCHAR(256),
    declared_value NUMERIC(39, 0),
    delivery_confirmation VARCHAR(128),
    dimension_unit VARCHAR(20),
    dry_ice_weight NUMERIC(39, 0),
    freight_charge_added_to_cod VARCHAR(64),
    has_additional_handling VARCHAR(3),
    has_cash_on_delivery VARCHAR(3),
    has_declared_value VARCHAR(3),
    has_insured_value VARCHAR(3),
    insured_value NUMERIC(39, 0),
    is_alcohol VARCHAR(3),
    is_non_hazardous_li_batteries VARCHAR(3),
    is_non_standard_container VARCHAR(3),
    item_fulfillment_id NUMERIC(39, 0),
    package_height NUMERIC(39, 0),
    package_length NUMERIC(39, 0),
    package_width NUMERIC(39, 0),
    priority_alert_content VARCHAR(256),
    priority_alert_type VARCHAR(32),
    reference_one VARCHAR(64),
    reference_two VARCHAR(64),
    signature_option VARCHAR(128),
    signature_release VARCHAR(32),
    tracking_number VARCHAR(64),
    weight_in_lbs NUMERIC(39, 0),
    your_packaging VARCHAR(32)
);

CREATE TABLE Shipping_items (
    by_per_item NUMERIC(39, 0),
    by_total_amount NUMERIC(39, 0),
    by_weight_amount NUMERIC(39, 0),
    by_weight_unit_index NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    default_unit_price VARCHAR(42),
    description VARCHAR(4000),
    display_name VARCHAR(4000),
    flat_rate_amount NUMERIC(39, 0),
    free_if_over_amount NUMERIC(39, 0),
    free_if_overactive VARCHAR(3),
    full_name VARCHAR(550),
    income_account_id NUMERIC(39, 0),
    is_fedex_one_rate VARCHAR(3),
    is_omit_packaging VARCHAR(3),
    isinactive VARCHAR(3),
    isonline VARCHAR(3),
    istaxable VARCHAR(3),
    item_extid VARCHAR(255),
    item_id NUMERIC(39, 0),
    maximum_shipping_amount NUMERIC(39, 0),
    minimum_shipping_amount NUMERIC(39, 0),
    name VARCHAR(250),
    parent_id NUMERIC(39, 0),
    per_item_default_price VARCHAR(42),
    pref_purchase_tax_id NUMERIC(39, 0),
    shipping_cost_function VARCHAR(32),
    shipping_rate NUMERIC(39, 0),
    tax_item_id NUMERIC(39, 0),
    use_maximum_ship_cost VARCHAR(3),
    use_minimum_ship_cost VARCHAR(3),
    vendor_id NUMERIC(39, 0)
);

CREATE TABLE Solution (
    date_last_modified TIMESTAMP,
    id_0 VARCHAR(99),
    is_available_online VARCHAR(3),
    long_description VARCHAR(65534),
    solution_extid VARCHAR(255),
    solution_id NUMERIC(39, 0)
);

CREATE TABLE Solutioncasemap (
    date_applied TIMESTAMP,
    entity_id NUMERIC(39, 0),
    solution_id NUMERIC(39, 0),
    supportcase_id NUMERIC(39, 0),
    PRIMARY KEY (solution_id, supportcase_id)
);

CREATE TABLE Solutiontopicmap (
    solution_id NUMERIC(39, 0),
    topic_id NUMERIC(39, 0),
    PRIMARY KEY (solution_id, topic_id)
);

CREATE TABLE Standard_cost_components (
    component_id NUMERIC(39, 0),
    cost_category VARCHAR(50),
    line_id NUMERIC(39, 0),
    planned_standard_cost_id NUMERIC(39, 0),
    quantity NUMERIC(39, 0),
    standard_cost NUMERIC(39, 0),
    PRIMARY KEY (line_id, planned_standard_cost_id)
);

CREATE TABLE States (
    country_id NUMERIC(39, 0),
    name VARCHAR(50),
    short_name VARCHAR(36),
    state_id NUMERIC(38, 0) PRIMARY KEY
);

CREATE TABLE Subscript_line_price_intervals (
    charge_frequency_id VARCHAR(20),
    date_end_exclusive TIMESTAMP,
    date_start_inclusive TIMESTAMP,
    discount NUMERIC(39, 0),
    included_quantity NUMERIC(39, 0),
    is_discount_percentage VARCHAR(3),
    plan_line_id NUMERIC(39, 0),
    plan_line_number NUMERIC(39, 0),
    price_plan_id NUMERIC(39, 0),
    prorate_by VARCHAR(10),
    quantity NUMERIC(18, 8),
    repeat_every NUMERIC(39, 0),
    status_id VARCHAR(25),
    subscription_line_id NUMERIC(39, 0)
);

CREATE TABLE Subscription_co_lines (
    change_order_action_id VARCHAR(23),
    change_order_id NUMERIC(39, 0),
    discount NUMERIC(39, 0),
    is_discount_percentage VARCHAR(3),
    plan_item_id NUMERIC(39, 0),
    price_plan_id NUMERIC(39, 0),
    quantity NUMERIC(18, 8),
    recurring_amount NUMERIC(20, 2),
    status_id VARCHAR(25),
    subscription_id NUMERIC(39, 0),
    subscription_line_id NUMERIC(39, 0)
);

CREATE TABLE Subscription_line_revisions (
    change_order_id NUMERIC(39, 0),
    created_by VARCHAR(167),
    date_change_order_effective TIMESTAMP,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    delta_amount NUMERIC(26, 8),
    delta_quantity NUMERIC(18, 8),
    discount NUMERIC(39, 0),
    is_applied_to_change_order VARCHAR(3),
    is_created_from_void VARCHAR(3),
    is_discount_percentage VARCHAR(3),
    is_overage_discount_percentage VARCHAR(3),
    overage_discount NUMERIC(39, 0),
    overage_price_plan_id NUMERIC(39, 0),
    price_plan_id NUMERIC(39, 0),
    quantity NUMERIC(39, 0),
    recurring_amount NUMERIC(39, 0),
    revenue_element_id NUMERIC(39, 0),
    subscription_line_id NUMERIC(39, 0),
    subscription_revision NUMERIC(39, 0),
    total_contract_value NUMERIC(26, 8)
);

CREATE TABLE Subscription_plan_lines (
    billing_mode_id VARCHAR(32),
    is_prorate_end_date VARCHAR(3),
    is_prorate_start_date VARCHAR(3),
    is_required VARCHAR(3),
    item_id NUMERIC(39, 0),
    parent_id NUMERIC(39, 0),
    plan_line_id NUMERIC(39, 0) PRIMARY KEY,
    plan_line_number NUMERIC(39, 0),
    plan_line_type VARCHAR(50),
    renewal_option VARCHAR(14),
    revenue_recognition_option_id VARCHAR(30),
    usage_multiplier_line_id NUMERIC(39, 0)
);

CREATE TABLE Subscription_terms (
    duration NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    name VARCHAR(200),
    term_extid VARCHAR(255),
    term_id NUMERIC(39, 0) PRIMARY KEY,
    term_type_id VARCHAR(10),
    unit_id VARCHAR(10)
);

CREATE TABLE Subscription_change_orders (
    action_id VARCHAR(23),
    approval_status_id VARCHAR(18),
    change_order_extid VARCHAR(255),
    change_order_id NUMERIC(39, 0) PRIMARY KEY,
    change_order_number VARCHAR(60),
    date_approval TIMESTAMP,
    date_created TIMESTAMP,
    date_effective TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_new_end TIMESTAMP,
    date_renewal_start TIMESTAMP,
    memo VARCHAR(400),
    reactivation_option_id VARCHAR(31),
    renewal_method_id VARCHAR(30),
    renewal_price_book_id NUMERIC(39, 0),
    renewal_subscription_plan_id NUMERIC(39, 0),
    renewal_term_id NUMERIC(39, 0),
    renewal_transaction_type VARCHAR(8),
    requester_id NUMERIC(39, 0),
    status_id VARCHAR(30),
    subscription_id NUMERIC(39, 0)
);

CREATE TABLE Subscription_plans (
    advance_renewal_period_number VARCHAR(11),
    advance_renewal_period_unit_id VARCHAR(10),
    class_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    default_renewal_method_id VARCHAR(30),
    default_renewal_plan_id NUMERIC(39, 0),
    default_renewal_term_id NUMERIC(39, 0),
    default_renewal_trantype_id VARCHAR(8),
    department_id NUMERIC(39, 0),
    description VARCHAR(4000),
    display_name VARCHAR(4000),
    income_account_id NUMERIC(39, 0),
    initial_term_id NUMERIC(39, 0),
    is_auto_renewal VARCHAR(3),
    is_inactive VARCHAR(3),
    is_include_children VARCHAR(3),
    location_id NUMERIC(39, 0),
    name VARCHAR(250),
    plan_extid VARCHAR(255),
    plan_id NUMERIC(39, 0) PRIMARY KEY,
    subsidiary_id NUMERIC(39, 0)
);

CREATE TABLE Subsidiaries (
    address VARCHAR(999),
    address1 VARCHAR(150),
    address2 VARCHAR(150),
    base_currency_id NUMERIC(39, 0),
    city VARCHAR(50),
    country VARCHAR(2),
    date_last_modified TIMESTAMP,
    edition VARCHAR(20),
    federal_number VARCHAR(40),
    fiscal_calendar_id NUMERIC(39, 0),
    full_name VARCHAR(4000),
    is_elimination VARCHAR(3),
    is_moss VARCHAR(3),
    isinactive VARCHAR(3),
    isinactive_bool VARCHAR(1),
    legal_name VARCHAR(83),
    moss_nexus_id NUMERIC(39, 0),
    name VARCHAR(83),
    parent_id NUMERIC(39, 0),
    purchaseorderamount NUMERIC(20, 2),
    purchaseorderquantity NUMERIC(18, 8),
    purchaseorderquantitydiff NUMERIC(18, 8),
    receiptamount NUMERIC(20, 2),
    receiptquantity NUMERIC(18, 8),
    receiptquantitydiff NUMERIC(18, 8),
    return_address VARCHAR(999),
    return_address1 VARCHAR(150),
    return_address2 VARCHAR(150),
    return_city VARCHAR(50),
    return_country VARCHAR(50),
    return_state VARCHAR(50),
    return_zipcode VARCHAR(36),
    shipping_address VARCHAR(999),
    shipping_address1 VARCHAR(150),
    shipping_address2 VARCHAR(150),
    shipping_city VARCHAR(50),
    shipping_country VARCHAR(50),
    shipping_state VARCHAR(50),
    shipping_zipcode VARCHAR(36),
    state VARCHAR(20),
    state_tax_number VARCHAR(40),
    subsidiary_extid VARCHAR(255),
    subsidiary_id NUMERIC(39, 0) PRIMARY KEY,
    tran_num_prefix VARCHAR(8),
    url VARCHAR(64),
    zipcode VARCHAR(36)
);

CREATE TABLE Subsidiary_book_map (
    accounting_book_id NUMERIC(39, 0),
    contract_defer_expense_acct_id NUMERIC(39, 0),
    contract_expense_acct_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    exchange_rate NUMERIC(30, 15),
    status VARCHAR(128),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (accounting_book_id, subsidiary_id)
);

CREATE TABLE Subsidiary_class_map (
    class_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (class_id, subsidiary_id)
);

CREATE TABLE Subsidiary_department_map (
    department_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (department_id, subsidiary_id)
);

CREATE TABLE Subsidiary_location_map (
    location_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (location_id, subsidiary_id)
);

CREATE TABLE Subsidiary_nexus_map (
    nexus_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    PRIMARY KEY (nexus_id, subsidiary_id)
);

CREATE TABLE Supplier_categories (
    category_name VARCHAR(4000),
    supplier_category_id VARCHAR(32)
);

CREATE TABLE Support_incidents (
    assigned_id NUMERIC(39, 0),
    case_email VARCHAR(300),
    case_extid VARCHAR(255),
    case_id NUMERIC(39, 0) PRIMARY KEY,
    case_issue_id NUMERIC(39, 0),
    case_number NUMERIC(39, 0),
    case_numbercode VARCHAR(99),
    case_origin_id NUMERIC(39, 0),
    case_phone VARCHAR(99),
    case_profile_id NUMERIC(39, 0),
    case_stage VARCHAR(12),
    case_type_id NUMERIC(39, 0),
    comments VARCHAR(4000),
    company_id NUMERIC(39, 0),
    contact_id NUMERIC(39, 0),
    create_date TIMESTAMP,
    date_closed TIMESTAMP,
    date_last_modified TIMESTAMP,
    entry_time TIMESTAMP,
    helpdesk VARCHAR(3),
    inboundemail VARCHAR(300),
    isinactive VARCHAR(3),
    item_id NUMERIC(39, 0),
    last_modification TIMESTAMP,
    last_reopened_date TIMESTAMP,
    module_name VARCHAR(4000),
    name VARCHAR(256),
    owner_id NUMERIC(39, 0),
    priority VARCHAR(64),
    product VARCHAR(64),
    stage VARCHAR(30),
    status VARCHAR(64),
    subsidiary_id NUMERIC(39, 0),
    territory_id NUMERIC(39, 0)
);

CREATE TABLE Support_reps (
    account_number VARCHAR(4000),
    address VARCHAR(999),
    address1 VARCHAR(150),
    address2 VARCHAR(150),
    address3 VARCHAR(150),
    approval_limit NUMERIC(20, 2),
    approver_id NUMERIC(39, 0),
    birthdate TIMESTAMP,
    city VARCHAR(50),
    class_id NUMERIC(39, 0),
    country VARCHAR(50),
    create_date TIMESTAMP,
    date_last_modified TIMESTAMP,
    def_acct_corp_card_expenses_id NUMERIC(39, 0),
    def_expense_report_currency_id NUMERIC(39, 0),
    department_id NUMERIC(39, 0),
    email VARCHAR(254),
    employee_type_id NUMERIC(39, 0),
    firstname VARCHAR(32),
    full_name VARCHAR(1800),
    identification_number VARCHAR(11),
    initials VARCHAR(3),
    isinactive VARCHAR(3),
    lastname VARCHAR(32),
    loginaccess VARCHAR(3),
    midname VARCHAR(32),
    name VARCHAR(83),
    notes VARCHAR(4000),
    phone VARCHAR(100),
    salutation VARCHAR(30),
    state VARCHAR(50),
    subsidiary_id NUMERIC(39, 0),
    supervisor_id NUMERIC(39, 0),
    support_rep_extid VARCHAR(255),
    support_rep_id NUMERIC(39, 0),
    zipcode VARCHAR(36)
);

CREATE TABLE Support_territories (
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    isinactive VARCHAR(3),
    name VARCHAR(50),
    priority NUMERIC(39, 0),
    sales_territory_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Supportcasehistory (
    case_id NUMERIC(39, 0),
    date_closed TIMESTAMP,
    date_created TIMESTAMP,
    employee_id NUMERIC(39, 0)
);

CREATE TABLE System_notes (
    author_id NUMERIC(39, 0),
    company_id NUMERIC(39, 0),
    context_type_name VARCHAR(256),
    custom_field VARCHAR(40),
    date_created TIMESTAMP,
    event_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    line_id NUMERIC(39, 0),
    line_transaction_id NUMERIC(39, 0),
    name VARCHAR(283),
    note_type_id NUMERIC(39, 0),
    operation VARCHAR(264),
    record_id NUMERIC(39, 0),
    record_type_id NUMERIC(39, 0),
    role_id NUMERIC(39, 0),
    standard_field VARCHAR(40),
    transaction_id NUMERIC(39, 0),
    value_new VARCHAR(4000),
    value_old VARCHAR(4000)
);

CREATE TABLE System_notes_custom (
    author_id NUMERIC(39, 0),
    company_id NUMERIC(39, 0),
    context_type_name VARCHAR(256),
    custom_field VARCHAR(40),
    customfield_created_by_id NUMERIC(39, 0),
    customfield_modified_by_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_customfield_created TIMESTAMP,
    date_customfield_modified TIMESTAMP,
    event_id NUMERIC(39, 0),
    item_id NUMERIC(39, 0),
    line_id NUMERIC(39, 0),
    line_transaction_id NUMERIC(39, 0),
    name VARCHAR(227),
    note_type_id NUMERIC(39, 0),
    operation VARCHAR(208),
    record_id NUMERIC(39, 0),
    record_type_id NUMERIC(39, 0),
    role_id NUMERIC(39, 0),
    standard_field VARCHAR(40),
    transaction_id NUMERIC(39, 0),
    value_new VARCHAR(4000),
    value_old VARCHAR(4000)
);

CREATE TABLE Tasks (
    assigned_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    due_date TIMESTAMP,
    estimated_hours NUMERIC(12, 5),
    estimated_hours_override NUMERIC(12, 5),
    isinactive VARCHAR(3),
    message VARCHAR(4000),
    name VARCHAR(256),
    owner_id NUMERIC(39, 0),
    priority VARCHAR(32),
    start_date TIMESTAMP,
    status VARCHAR(64),
    task_extid VARCHAR(255),
    task_id NUMERIC(39, 0),
    taskorder NUMERIC(39, 0)
);

CREATE TABLE Task_contacts (
    company_id NUMERIC(39, 0),
    contact_id NUMERIC(39, 0),
    task_id NUMERIC(39, 0)
);

CREATE TABLE Tax_items (
    date_last_modified TIMESTAMP,
    description VARCHAR(4000),
    full_name VARCHAR(550),
    income_account_id NUMERIC(39, 0),
    isinactive VARCHAR(3),
    item_extid VARCHAR(255),
    item_id NUMERIC(39, 0) PRIMARY KEY,
    name VARCHAR(250),
    parent_id NUMERIC(39, 0),
    rate VARCHAR(42),
    tax_city VARCHAR(4000),
    tax_county VARCHAR(41),
    tax_state VARCHAR(2),
    tax_type_id NUMERIC(39, 0),
    tax_zipcode VARCHAR(4000),
    vendor_id NUMERIC(39, 0),
    vendorname VARCHAR(250)
);

CREATE TABLE Territory (
    date_last_modified TIMESTAMP,
    description VARCHAR(199),
    is_inactive VARCHAR(3),
    name VARCHAR(50),
    territory_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Time_based_charge_rules (
    adjust_time_to_fit_under_cap VARCHAR(1),
    billing_rate_card_id NUMERIC(39, 0),
    cap_hours NUMERIC(12, 5),
    cap_money NUMERIC(20, 2),
    cap_type VARCHAR(5),
    charge_rule_id NUMERIC(39, 0),
    charge_rule_type VARCHAR(32),
    charge_stage VARCHAR(32),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    description VARCHAR(4000),
    dont_bill_entry_exceeding_cap VARCHAR(1),
    end_date TIMESTAMP,
    external_id VARCHAR(255),
    form_template NUMERIC(39, 0),
    project_id NUMERIC(39, 0),
    rate_multiplier NUMERIC(12, 3),
    rate_source VARCHAR(10),
    rounding VARCHAR(10),
    rule_name VARCHAR(200),
    rule_order NUMERIC(39, 0),
    sale_unit_id NUMERIC(39, 0),
    saved_search NUMERIC(39, 0),
    start_date TIMESTAMP,
    time_based_charge_rule_id NUMERIC(39, 0),
    units_type_id NUMERIC(39, 0)
);

CREATE TABLE Timesheet (
    date_last_modified TIMESTAMP,
    employee_id NUMERIC(39, 0),
    end_date TIMESTAMP,
    start_date TIMESTAMP,
    status_code VARCHAR(200),
    timesheet_id NUMERIC(39, 0)
);

CREATE TABLE Topic (
    description VARCHAR(4000),
    is_inactive VARCHAR(3),
    long_description VARCHAR(4000),
    name VARCHAR(99),
    parent_topic_id NUMERIC(39, 0),
    topic_extid VARCHAR(255),
    topic_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Trans_partner_sales_teams (
    contribution NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    isprimary VARCHAR(3),
    partner_id NUMERIC(39, 0),
    partner_sales_role_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    PRIMARY KEY (partner_id, transaction_id)
);

CREATE TABLE Transactions (
    account_based_number VARCHAR(138),
    accounting_book_id NUMERIC(39, 0),
    accounting_period_id NUMERIC(39, 0),
    acct_corp_card_expenses_id NUMERIC(39, 0),
    amount_unbilled NUMERIC(20, 2),
    bill_pay_transaction VARCHAR(3),
    billaddress VARCHAR(999),
    billing_account_id NUMERIC(39, 0),
    billing_instructions VARCHAR(999),
    buildable NUMERIC(39, 0),
    bulk_submission_id NUMERIC(39, 0),
    carrier VARCHAR(100),
    closed TIMESTAMP,
    company_status_id NUMERIC(39, 0),
    contract_cost_amount NUMERIC(20, 2),
    contract_defer_expense_acct_id NUMERIC(39, 0),
    contract_expense_acct_id NUMERIC(39, 0),
    contract_expense_src_acct_id NUMERIC(39, 0),
    create_date TIMESTAMP,
    created_by_id NUMERIC(39, 0),
    created_from_id NUMERIC(39, 0),
    currency_id NUMERIC(39, 0),
    custom_form_id NUMERIC(39, 0),
    date_actual_prod_end TIMESTAMP,
    date_actual_prod_start TIMESTAMP,
    date_bid_close TIMESTAMP,
    date_bid_open TIMESTAMP,
    date_contract_cost_accrual TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_tax_point TIMESTAMP,
    due_date TIMESTAMP,
    email VARCHAR(256),
    end_date TIMESTAMP,
    entity_id NUMERIC(39, 0),
    entity_tax_reg_num VARCHAR(30),
    exchange_rate NUMERIC(30, 15),
    expected_close TIMESTAMP,
    external_ref_number VARCHAR(138),
    fax VARCHAR(100),
    fob VARCHAR(13),
    forecast_type VARCHAR(384),
    include_in_forecast VARCHAR(3),
    incoterm VARCHAR(100),
    intercompany_transaction_id NUMERIC(39, 0),
    is_actualprodenddate_manual VARCHAR(3),
    is_actualprodstartdate_manual VARCHAR(3),
    is_advanced_intercompany VARCHAR(3),
    is_autocalculate_lag VARCHAR(3),
    is_compliant VARCHAR(3),
    is_created_from_merge VARCHAR(3),
    is_cross_sub_transactions VARCHAR(3),
    is_finance_charge VARCHAR(3),
    is_firmed VARCHAR(3),
    is_in_transit_payment VARCHAR(3),
    is_intercompany VARCHAR(3),
    is_merged_into_arrangements VARCHAR(3),
    is_non_posting VARCHAR(3),
    is_override_installments VARCHAR(3),
    is_payment_hold VARCHAR(3),
    is_reversal VARCHAR(3),
    is_tax_point_date_override VARCHAR(3),
    is_tax_reg_override VARCHAR(3),
    is_wip VARCHAR(1),
    item_revision NUMERIC(39, 0),
    job_id NUMERIC(39, 0),
    landed_cost_allocation_method VARCHAR(8),
    last_modified_date TIMESTAMP,
    lead_source_id NUMERIC(39, 0),
    location_id NUMERIC(39, 0),
    memo VARCHAR(4000),
    memorized VARCHAR(3),
    message VARCHAR(999),
    needs_bill VARCHAR(3),
    needs_revenue_commitment VARCHAR(3),
    number_of_pricing_tiers NUMERIC(39, 0),
    opening_balance_transaction VARCHAR(3),
    ownership_transfer_id NUMERIC(39, 0),
    packing_list_instructions VARCHAR(999),
    partner_id NUMERIC(39, 0),
    payment_terms_id NUMERIC(39, 0),
    pn_ref_num VARCHAR(100),
    probability NUMERIC(6, 2),
    product_label_instructions VARCHAR(999),
    projected_total NUMERIC(20, 2),
    promotion_code_id NUMERIC(39, 0),
    promotion_code_instance_id NUMERIC(39, 0),
    purchase_order_instructions VARCHAR(999),
    related_tranid VARCHAR(138),
    renewal TIMESTAMP,
    revenue_commitment_status VARCHAR(480),
    revenue_committed TIMESTAMP,
    revenue_status VARCHAR(480),
    reversing_transaction_id NUMERIC(39, 0),
    sales_effective_date TIMESTAMP,
    sales_rep_id NUMERIC(39, 0),
    scheduling_method_id VARCHAR(15),
    shipaddress VARCHAR(999),
    shipment_received TIMESTAMP,
    shipping_item_id NUMERIC(39, 0),
    start_date TIMESTAMP,
    status VARCHAR(480),
    tax_reg_id NUMERIC(39, 0),
    title VARCHAR(200),
    trandate TIMESTAMP,
    tranid VARCHAR(138),
    trans_is_vsoe_bundle VARCHAR(3),
    transaction_extid VARCHAR(255),
    transaction_id NUMERIC(39, 0) PRIMARY KEY,
    transaction_number VARCHAR(138),
    transaction_partner VARCHAR(40),
    transaction_source VARCHAR(4000),
    transaction_type VARCHAR(192),
    transaction_website NUMERIC(39, 0),
    transfer_location NUMERIC(39, 0),
    use_item_cost_as_transfer_cost VARCHAR(3),
    visible_in_customer_center VARCHAR(1),
    weighted_total NUMERIC(39, 0)
);

CREATE TABLE Transaction_address (
    bill_address_line_1 VARCHAR(150),
    bill_address_line_2 VARCHAR(150),
    bill_address_line_3 VARCHAR(150),
    bill_city VARCHAR(50),
    bill_company VARCHAR(100),
    bill_country VARCHAR(50),
    bill_name VARCHAR(150),
    bill_phone_number VARCHAR(100),
    bill_state VARCHAR(50),
    bill_zip VARCHAR(36),
    created_by_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    last_modified_by_id NUMERIC(39, 0),
    return_address_line_1 VARCHAR(150),
    return_address_line_2 VARCHAR(150),
    return_city VARCHAR(50),
    return_country VARCHAR(50),
    return_state VARCHAR(50),
    return_zipcode VARCHAR(36),
    ship_address_line_1 VARCHAR(150),
    ship_address_line_2 VARCHAR(150),
    ship_address_line_3 VARCHAR(150),
    ship_attention VARCHAR(249),
    ship_city VARCHAR(50),
    ship_company VARCHAR(100),
    ship_country VARCHAR(50),
    ship_name VARCHAR(150),
    ship_phone_number VARCHAR(100),
    ship_state VARCHAR(50),
    ship_zip VARCHAR(36),
    transaction_address_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    PRIMARY KEY (transaction_address_id, transaction_id)
);

CREATE TABLE Transaction_bin_numbers (
    bin_number VARCHAR(100),
    quantity NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    transaction_line NUMERIC(39, 0)
);

CREATE TABLE Transaction_book_map (
    accounting_book_id NUMERIC(39, 0),
    date_revenue_committed TIMESTAMP,
    exchange_rate NUMERIC(30, 15),
    is_vsoe_bundle VARCHAR(3),
    needs_revenue_commitment VARCHAR(3),
    revenue_commitment_status VARCHAR(480),
    revenue_status VARCHAR(480),
    transaction_id NUMERIC(39, 0),
    PRIMARY KEY (accounting_book_id, transaction_id)
);

CREATE TABLE Transaction_cost_components (
    amount NUMERIC(20, 2),
    cost_category VARCHAR(50),
    item_id NUMERIC(39, 0),
    quantity NUMERIC(39, 0),
    standard_cost NUMERIC(30, 15),
    transaction_id NUMERIC(39, 0),
    transaction_line NUMERIC(39, 0)
);

CREATE TABLE Transaction_history (
    account_id NUMERIC(39, 0),
    action VARCHAR(8),
    amount NUMERIC(20, 2),
    date_time TIMESTAMP,
    date_transaction TIMESTAMP,
    document_number VARCHAR(90),
    entity_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    transaction_number VARCHAR(138),
    transaction_type VARCHAR(8),
    user_id NUMERIC(39, 0)
);

CREATE TABLE Transaction_inventory_numbers (
    inventory_number VARCHAR(100),
    quantity NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    transaction_line NUMERIC(39, 0)
);

CREATE TABLE Transaction_line_book_map (
    account_id NUMERIC(39, 0),
    accounting_book_id NUMERIC(39, 0),
    alt_sales_amount NUMERIC(20, 2),
    amortization_residual VARCHAR(42),
    amount NUMERIC(20, 2),
    amount_linked NUMERIC(20, 2),
    bill_variance_status VARCHAR(128),
    catch_up_period_id NUMERIC(39, 0),
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_rev_rec_end TIMESTAMP,
    date_rev_rec_start TIMESTAMP,
    date_revenue_committed TIMESTAMP,
    gl_number VARCHAR(80),
    gl_sequence VARCHAR(40),
    gl_sequence_id NUMERIC(39, 0),
    gross_amount NUMERIC(39, 0),
    is_hold_rev_rec VARCHAR(3),
    quantity_committed NUMERIC(18, 8),
    schedule_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0),
    vsoe_allocation NUMERIC(20, 2),
    PRIMARY KEY (accounting_book_id, transaction_id, transaction_line_id)
);

CREATE TABLE Transaction_lines (
    account_id NUMERIC(39, 0),
    alt_sales_amount NUMERIC(20, 2),
    amortization_residual VARCHAR(42),
    amount NUMERIC(20, 2),
    amount_foreign NUMERIC(20, 2),
    amount_foreign_linked NUMERIC(30, 15),
    amount_linked NUMERIC(20, 2),
    amount_pending NUMERIC(20, 2),
    amount_settlement NUMERIC(20, 2),
    amount_taxable NUMERIC(20, 2),
    amount_taxed NUMERIC(20, 2),
    bill_variance_status VARCHAR(128),
    billing_schedule_id NUMERIC(39, 0),
    billing_subsidiary_id NUMERIC(39, 0),
    bom_quantity NUMERIC(18, 8),
    catch_up_period_id NUMERIC(39, 0),
    charge_rule_id NUMERIC(39, 0),
    charge_type NUMERIC(39, 0),
    class_id NUMERIC(39, 0),
    company_id NUMERIC(39, 0),
    component_id NUMERIC(39, 0),
    component_yield NUMERIC(39, 0),
    cost_estimate_type VARCHAR(200),
    date_cleared TIMESTAMP,
    date_closed TIMESTAMP,
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_last_modified_gmt TIMESTAMP,
    date_requested TIMESTAMP,
    date_revenue_committed TIMESTAMP,
    delay_rev_rec VARCHAR(3),
    department_id NUMERIC(39, 0),
    do_not_display_line VARCHAR(3),
    do_not_print_line VARCHAR(3),
    do_restock VARCHAR(3),
    estimated_cost NUMERIC(20, 2),
    estimated_cost_foreign NUMERIC(20, 2),
    expected_receipt_date TIMESTAMP,
    expense_category_id NUMERIC(39, 0),
    gl_number VARCHAR(80),
    gl_sequence VARCHAR(40),
    gl_sequence_id NUMERIC(39, 0),
    gross_amount NUMERIC(39, 0),
    has_cost_line VARCHAR(3),
    is_allocation VARCHAR(1),
    is_amortization_rev_rec VARCHAR(3),
    is_commitment_confirmed VARCHAR(3),
    is_cost_line VARCHAR(3),
    is_custom_line VARCHAR(3),
    is_exclude_from_rate_request VARCHAR(3),
    is_fx_variance VARCHAR(3),
    is_item_value_adjustment VARCHAR(3),
    is_landed_cost VARCHAR(3),
    is_scrap VARCHAR(3),
    is_vsoe_allocation_line VARCHAR(3),
    isbillable VARCHAR(3),
    iscleared VARCHAR(3),
    isnonreimbursable VARCHAR(3),
    istaxable VARCHAR(3),
    item_count NUMERIC(18, 8),
    item_id NUMERIC(39, 0),
    item_received VARCHAR(3),
    item_source VARCHAR(30),
    item_unit_price VARCHAR(42),
    kit_part_number NUMERIC(39, 0),
    landed_cost_source_line_id NUMERIC(38, 0),
    location_id NUMERIC(39, 0),
    match_bill_to_receipt VARCHAR(1),
    memo VARCHAR(4000),
    needs_revenue_element VARCHAR(3),
    net_amount NUMERIC(39, 0),
    net_amount_foreign NUMERIC(39, 0),
    non_posting_line VARCHAR(3),
    number_billed NUMERIC(18, 8),
    operation_sequence_number NUMERIC(39, 0),
    order_priority NUMERIC(20, 2),
    payment_method_id NUMERIC(39, 0),
    payroll_item_id NUMERIC(39, 0),
    payroll_wage_base_amount NUMERIC(20, 2),
    payroll_year_to_date_amount NUMERIC(20, 2),
    period_closed TIMESTAMP,
    price_type_id NUMERIC(39, 0),
    project_task_id NUMERIC(39, 0),
    purchase_contract_id NUMERIC(39, 0),
    quantity_allocated NUMERIC(30, 15),
    quantity_committed NUMERIC(30, 15),
    quantity_packed NUMERIC(18, 8),
    quantity_picked NUMERIC(18, 8),
    quantity_received_in_shipment NUMERIC(18, 8),
    receivebydate TIMESTAMP,
    reimbursement_type VARCHAR(128),
    related_company_id NUMERIC(39, 0),
    rev_rec_end_date TIMESTAMP,
    rev_rec_rule_id NUMERIC(39, 0),
    rev_rec_start_date TIMESTAMP,
    revenue_element_id NUMERIC(39, 0),
    schedule_id NUMERIC(39, 0),
    shipdate TIMESTAMP,
    shipment_received TIMESTAMP,
    shipping_group_id NUMERIC(39, 0),
    source_subsidiary_id NUMERIC(39, 0),
    subscription_line_id NUMERIC(39, 0),
    subsidiary_id NUMERIC(39, 0),
    tax_item_id NUMERIC(39, 0),
    tax_type VARCHAR(64),
    term_in_months NUMERIC(39, 0),
    tobeemailed VARCHAR(3),
    tobefaxed VARCHAR(3),
    tobeprinted VARCHAR(3),
    transaction_discount_line VARCHAR(3),
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0),
    transaction_order NUMERIC(39, 0),
    transfer_order_item_line NUMERIC(39, 0),
    transfer_order_line_type VARCHAR(25),
    unique_key NUMERIC(39, 0),
    unit_cost_override NUMERIC(30, 15),
    unit_of_measure_id NUMERIC(39, 0),
    vsoe_allocation NUMERIC(20, 2),
    vsoe_amt NUMERIC(20, 2),
    vsoe_deferral VARCHAR(28),
    vsoe_delivered VARCHAR(3),
    vsoe_discount VARCHAR(12),
    vsoe_price NUMERIC(30, 15),
    PRIMARY KEY (transaction_id, transaction_line_id)
);

CREATE TABLE Transaction_links (
    amount_foreign_linked NUMERIC(20, 2),
    amount_linked NUMERIC(20, 2),
    applied_date_posted TIMESTAMP,
    applied_transaction_id NUMERIC(39, 0),
    applied_transaction_line_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    discount VARCHAR(3),
    inventory_number VARCHAR(100),
    link_type VARCHAR(4000),
    link_type_code VARCHAR(8),
    original_date_posted TIMESTAMP,
    original_transaction_id NUMERIC(39, 0),
    original_transaction_line_id NUMERIC(39, 0),
    quantity_linked NUMERIC(39, 0),
    PRIMARY KEY (applied_transaction_id, applied_transaction_line_id, inventory_number, link_type_code, original_transaction_id, original_transaction_line_id)
);

CREATE TABLE Transaction_sales_teams (
    contribution NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    isprimary VARCHAR(3),
    sales_rep_id NUMERIC(39, 0),
    sales_role_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    PRIMARY KEY (sales_rep_id, transaction_id)
);

CREATE TABLE Transaction_shipping_groups (
    handling_line_id NUMERIC(39, 0),
    shipping_group_id NUMERIC(39, 0),
    shipping_item_id NUMERIC(39, 0),
    shipping_line_id NUMERIC(39, 0),
    transaction_address_id NUMERIC(39, 0),
    transaction_id NUMERIC(39, 0),
    PRIMARY KEY (shipping_group_id, transaction_id)
);

CREATE TABLE Transaction_tax_detail (
    account_id NUMERIC(39, 0),
    amount NUMERIC(20, 2),
    amount_foreign NUMERIC(20, 2),
    amount_net NUMERIC(23, 5),
    calculation_comment VARCHAR(65534),
    tax_basis_amount NUMERIC(39, 0),
    tax_item_id NUMERIC(39, 0),
    tax_rate NUMERIC(21, 11),
    tax_type VARCHAR(5),
    transaction_id NUMERIC(39, 0),
    transaction_line_id NUMERIC(39, 0),
    PRIMARY KEY (tax_item_id, transaction_id, transaction_line_id)
);

CREATE TABLE Transaction_tracking_numbers (
    tracking_number VARCHAR(64),
    transaction_id NUMERIC(39, 0)
);

CREATE TABLE Units_type (
    date_last_modified TIMESTAMP,
    isinactive VARCHAR(3),
    name VARCHAR(40),
    units_type_extid VARCHAR(255),
    units_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Unlocked_time_periods (
    date_created TIMESTAMP,
    date_last_modified TIMESTAMP,
    date_period_end TIMESTAMP,
    date_period_start TIMESTAMP,
    date_valid_until TIMESTAMP,
    employee_id NUMERIC(39, 0),
    is_inactive VARCHAR(3),
    last_modified_by_id NUMERIC(39, 0),
    unlocked_time_period_extid VARCHAR(255),
    unlocked_time_period_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Uom (
    abbreviation VARCHAR(20),
    conversion_rate NUMERIC(18, 8),
    date_last_modified TIMESTAMP,
    is_base_unit VARCHAR(3),
    name VARCHAR(40),
    plural_abbreviation VARCHAR(20),
    plural_name VARCHAR(40),
    units_type_id NUMERIC(39, 0),
    uom_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Usages (
    date_usage TIMESTAMP,
    usage_customer_id NUMERIC(39, 0),
    usage_extid VARCHAR(255),
    usage_id NUMERIC(39, 0) PRIMARY KEY,
    usage_item_id NUMERIC(39, 0),
    usage_memo VARCHAR(4000),
    usage_quantity NUMERIC(18, 8),
    usage_subscription_id NUMERIC(39, 0),
    usage_subscription_line_id NUMERIC(39, 0),
    usage_subscription_plan_id NUMERIC(39, 0)
);

CREATE TABLE Vendors (
    accountnumber VARCHAR(99),
    altemail VARCHAR(254),
    altphone VARCHAR(100),
    billaddress VARCHAR(999),
    billing_class_id NUMERIC(39, 0),
    city VARCHAR(50),
    comments VARCHAR(4000),
    companyname VARCHAR(83),
    country VARCHAR(50),
    create_date TIMESTAMP,
    creditlimit NUMERIC(20, 2),
    currency_id NUMERIC(39, 0),
    date_last_modified TIMESTAMP,
    email VARCHAR(254),
    expense_account_id NUMERIC(39, 0),
    fax VARCHAR(100),
    full_name VARCHAR(1800),
    home_phone VARCHAR(100),
    in_transit_balance NUMERIC(39, 0),
    incoterm VARCHAR(100),
    is_person VARCHAR(3),
    is1099eligible VARCHAR(3),
    isemailhtml VARCHAR(3),
    isemailpdf VARCHAR(3),
    isinactive VARCHAR(3),
    labor_cost NUMERIC(39, 0),
    last_modified_date TIMESTAMP,
    line1 VARCHAR(150),
    line2 VARCHAR(150),
    line3 VARCHAR(150),
    loginaccess VARCHAR(3),
    mobile_phone VARCHAR(100),
    name VARCHAR(83),
    openbalance NUMERIC(39, 0),
    openbalance_foreign NUMERIC(39, 0),
    payables_account_id NUMERIC(39, 0),
    payment_terms_id NUMERIC(39, 0),
    phone VARCHAR(100),
    printoncheckas VARCHAR(83),
    purchaseorderamount NUMERIC(20, 2),
    purchaseorderquantity NUMERIC(18, 8),
    purchaseorderquantitydiff NUMERIC(18, 8),
    receiptamount NUMERIC(20, 2),
    receiptquantity NUMERIC(18, 8),
    receiptquantitydiff NUMERIC(18, 8),
    represents_subsidiary_id NUMERIC(39, 0),
    shipaddress VARCHAR(999),
    state VARCHAR(50),
    subsidiary NUMERIC(39, 0),
    taxidnum VARCHAR(25),
    time_approver_id NUMERIC(39, 0),
    unbilled_orders NUMERIC(39, 0),
    unbilled_orders_foreign NUMERIC(39, 0),
    url VARCHAR(100),
    vendor_extid VARCHAR(255),
    vendor_id NUMERIC(39, 0) PRIMARY KEY,
    vendor_type_id NUMERIC(39, 0),
    zipcode VARCHAR(36)
);

CREATE TABLE Vendor_currencies (
    currency_id NUMERIC(39, 0),
    in_transit_balance_foreign NUMERIC(20, 2),
    openbalance_foreign NUMERIC(20, 2),
    unbilled_orders_foreign NUMERIC(20, 2),
    vendor_id NUMERIC(39, 0)
);

CREATE TABLE Vendor_subsidiary_map (
    subsidiary_id NUMERIC(39, 0),
    vendor_id NUMERIC(39, 0),
    PRIMARY KEY (subsidiary_id, vendor_id)
);

CREATE TABLE Vendor_types (
    isinactive VARCHAR(3),
    name VARCHAR(31),
    parent_id NUMERIC(39, 0),
    vendor_type_extid VARCHAR(255),
    vendor_type_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Winlossreason (
    date_last_modified TIMESTAMP,
    is_inactive VARCHAR(3),
    reason VARCHAR(50),
    win_loss_reason_extid VARCHAR(255),
    win_loss_reason_id NUMERIC(39, 0) PRIMARY KEY
);

CREATE TABLE Work_calendar_holidays (
    date_holiday TIMESTAMP,
    description VARCHAR(100),
    work_calendar_id NUMERIC(39, 0),
    PRIMARY KEY (date_holiday, work_calendar_id)
);

CREATE TABLE Work_calendars (
    isdefault VARCHAR(3),
    isfriday VARCHAR(3),
    isinactive VARCHAR(3),
    ismonday VARCHAR(3),
    issaturday VARCHAR(3),
    issunday VARCHAR(3),
    isthursday VARCHAR(3),
    istuesday VARCHAR(3),
    iswednesday VARCHAR(3),
    message VARCHAR(4000),
    name VARCHAR(100),
    start_hour TIMESTAMP,
    work_calendar_id NUMERIC(39, 0) PRIMARY KEY,
    work_hours_per_day NUMERIC(39, 0)
);

ALTER TABLE Accounts ADD CONSTRAINT accounts_accounts_fk FOREIGN KEY (deferral_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Accounts ADD CONSTRAINT accounts_accounts_fk_2 FOREIGN KEY (parent_id) REFERENCES Accounts (account_id);
ALTER TABLE Accounts ADD CONSTRAINT accounts_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Accounts ADD CONSTRAINT accounts_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Accounts ADD CONSTRAINT accounts_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Accounts ADD CONSTRAINT accounts_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Account_activity ADD CONSTRAINT account_activity_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Account_activity ADD CONSTRAINT account_activity_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Account_activity ADD CONSTRAINT account_activity_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Account_activity ADD CONSTRAINT account_activity_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Account_period_activity ADD CONSTRAINT account_period_activity_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Account_period_activity ADD CONSTRAINT account_period_activity_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Account_period_activity ADD CONSTRAINT account_period_activity_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Account_period_activity ADD CONSTRAINT account_period_activity_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Account_period_activity ADD CONSTRAINT account_period_activity_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Account_period_activity_pe ADD CONSTRAINT account_period_activity_pe_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Account_period_activity_pe ADD CONSTRAINT account_period_activity_pe_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Account_period_activity_pe ADD CONSTRAINT account_period_activity_pe_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Account_period_activity_pe ADD CONSTRAINT account_period_activity_pe_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Accounting_books ADD CONSTRAINT accounting_books_accounting_books_fk FOREIGN KEY (base_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Accounting_periods ADD CONSTRAINT accounting_periods_accounting_periods_fk FOREIGN KEY (parent_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Accounting_periods ADD CONSTRAINT accounting_periods_accounting_periods_fk_2 FOREIGN KEY (year_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Address_book ADD CONSTRAINT address_book_addresses_fk FOREIGN KEY (address_id) REFERENCES Addresses (address_id);
ALTER TABLE Amortization_sched_lines ADD CONSTRAINT amortization_sched_lines_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Amortization_sched_lines ADD CONSTRAINT amortization_sched_lines_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Amortization_sched_lines ADD CONSTRAINT amortization_sched_lines_amortization_schedules_fk FOREIGN KEY (schedule_id) REFERENCES Amortization_schedules (schedule_id);
ALTER TABLE Amortization_sched_lines ADD CONSTRAINT amortization_sched_lines_transactions_fk FOREIGN KEY (journal_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Bill_of_materials ADD CONSTRAINT bill_of_materials_items_fk FOREIGN KEY (original_assembly_id) REFERENCES Items (item_id);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_billing_classes_fk FOREIGN KEY (billing_class_id) REFERENCES Billing_classes (billing_class_id);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_billing_rate_cards_fk FOREIGN KEY (billing_rate_card_id) REFERENCES Billing_rate_cards (billing_rate_card_id);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_billing_rate_cards_versions_fk FOREIGN KEY (billing_rate_card_id, version_0) REFERENCES Billing_rate_cards_versions (billing_rate_card_id, version_0);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_items_fk FOREIGN KEY (service_item_id) REFERENCES Items (item_id);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_units_type_fk FOREIGN KEY (units_type_id) REFERENCES Units_type (units_type_id);
ALTER TABLE Billing_rate_cards_prices ADD CONSTRAINT billing_rate_cards_prices_uom_fk FOREIGN KEY (sale_unit_id) REFERENCES Uom (uom_id);
ALTER TABLE Billing_rate_cards_versions ADD CONSTRAINT billing_rate_cards_versions_employees_fk FOREIGN KEY (last_modified_by_id) REFERENCES Employees (employee_id);
ALTER TABLE Billing_subscription_lines ADD CONSTRAINT billing_subscription_lines_billing_subscription_lines_fk FOREIGN KEY (usage_multiplier_line_id) REFERENCES Billing_subscription_lines (subline_id);
ALTER TABLE Billing_subscription_lines ADD CONSTRAINT billing_subscription_lines_billing_subscriptions_fk FOREIGN KEY (subscription_id) REFERENCES Billing_subscriptions (subscription_id);
ALTER TABLE Billing_subscription_lines ADD CONSTRAINT billing_subscription_lines_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Billing_subscription_lines ADD CONSTRAINT billing_subscription_lines_subscription_plan_lines_fk FOREIGN KEY (subscription_plan_line_id) REFERENCES Subscription_plan_lines (plan_line_id);
ALTER TABLE Billing_subscription_lines ADD CONSTRAINT billing_subscription_lines_transactions_fk FOREIGN KEY (purchase_order_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Billing_subscription_lines ADD CONSTRAINT billing_subscription_lines_transactions_fk_2 FOREIGN KEY (sales_order_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Billing_subscriptions ADD CONSTRAINT billing_subscriptions_billing_accounts_fk FOREIGN KEY (billing_account_id) REFERENCES Billing_accounts (billing_account_id);
ALTER TABLE Billing_subscriptions ADD CONSTRAINT billing_subscriptions_subscription_plans_fk FOREIGN KEY (default_renewal_plan_id) REFERENCES Subscription_plans (plan_id);
ALTER TABLE Billing_subscriptions ADD CONSTRAINT billing_subscriptions_subscription_plans_fk_2 FOREIGN KEY (plan_id) REFERENCES Subscription_plans (plan_id);
ALTER TABLE Billing_subscriptions ADD CONSTRAINT billing_subscriptions_subscription_terms_fk FOREIGN KEY (default_renewal_term_id) REFERENCES Subscription_terms (term_id);
ALTER TABLE Billing_subscriptions ADD CONSTRAINT billing_subscriptions_subscription_terms_fk_2 FOREIGN KEY (initial_term_id) REFERENCES Subscription_terms (term_id);
ALTER TABLE Billing_subscriptions ADD CONSTRAINT billing_subscriptions_transactions_fk FOREIGN KEY (sales_order_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Billing_accounts ADD CONSTRAINT billing_accounts_address_book_fk_1 FOREIGN KEY (bill_to_address_book_id) REFERENCES Address_book (address_book_id);
ALTER TABLE Billing_accounts ADD CONSTRAINT billing_accounts_address_book_fk_2 FOREIGN KEY (ship_to_address_book_id) REFERENCES Address_book (address_book_id);
ALTER TABLE Billing_accounts ADD CONSTRAINT billing_accounts_billing_schedule_descriptions_fk FOREIGN KEY (billing_schedule_id) REFERENCES Billing_schedule_descriptions (billing_schedule_id);
ALTER TABLE Billing_rate_cards ADD CONSTRAINT billing_rate_cards_customers_fk FOREIGN KEY (customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Bom_revision_components ADD CONSTRAINT bom_revision_components_bom_revisions_fk FOREIGN KEY (bom_revision_id) REFERENCES Bom_revisions (bom_revision_id);
ALTER TABLE Bom_revision_components ADD CONSTRAINT bom_revision_components_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Bom_revision_components ADD CONSTRAINT bom_revision_components_uom_fk FOREIGN KEY (unit_of_measure_id) REFERENCES Uom (uom_id);
ALTER TABLE Bom_revisions ADD CONSTRAINT bom_revisions_bill_of_materials_fk FOREIGN KEY (bill_of_materials_id) REFERENCES Bill_of_materials (bill_of_materials_id);
ALTER TABLE Budget ADD CONSTRAINT budget_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Budget ADD CONSTRAINT budget_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Budget ADD CONSTRAINT budget_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Budget ADD CONSTRAINT budget_budget_category_fk FOREIGN KEY (category_id) REFERENCES Budget_category (budget_category_id);
ALTER TABLE Budget ADD CONSTRAINT budget_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Budget ADD CONSTRAINT budget_customers_fk FOREIGN KEY (customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Budget ADD CONSTRAINT budget_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Budget ADD CONSTRAINT budget_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Budget ADD CONSTRAINT budget_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Budget ADD CONSTRAINT budget_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_campaign_audiences_fk FOREIGN KEY (audience_id) REFERENCES Campaign_audiences (campaignaudience_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_campaign_categories_fk FOREIGN KEY (category_id) REFERENCES Campaign_categories (campaigncategory_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_campaign_families_fk FOREIGN KEY (family_id) REFERENCES Campaign_families (campaignfamily_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_campaign_search_engine_fk FOREIGN KEY (search_engine_id) REFERENCES Campaign_search_engine (search_engine_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_campaign_verticals_fk FOREIGN KEY (vertical_id) REFERENCES Campaign_verticals (campaignvertical_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_campaignoffer_fk FOREIGN KEY (offer_id) REFERENCES Campaignoffer (campaign_offer_id);
ALTER TABLE Campaigns ADD CONSTRAINT campaigns_entity_fk FOREIGN KEY (organizer_id) REFERENCES Entity (entity_id);
ALTER TABLE Campaign_categories ADD CONSTRAINT campaign_categories_campaign_categories_fk FOREIGN KEY (parent_id) REFERENCES Campaign_categories (campaigncategory_id);
ALTER TABLE Campaign_categories ADD CONSTRAINT campaign_categories_campaigns_fk FOREIGN KEY (default_campaign_id) REFERENCES Campaigns (campaign_id);
ALTER TABLE Campaign_subscription_statuses ADD CONSTRAINT campaign_subscription_statuses_campaign_subscriptions_fk FOREIGN KEY (subscription_id) REFERENCES Campaign_subscriptions (campaignsubscription_id);
ALTER TABLE Campaign_subscription_statuses ADD CONSTRAINT campaign_subscription_statuses_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_campaign_subscriptions_fk FOREIGN KEY (subscription_id) REFERENCES Campaign_subscriptions (campaignsubscription_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_campaignchannel_fk FOREIGN KEY (channel_id) REFERENCES Campaignchannel (campaign_channel_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_campaigns_fk FOREIGN KEY (campaign_id) REFERENCES Campaigns (campaign_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_crmgroup_fk FOREIGN KEY (group_id) REFERENCES Crmgroup (group_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_crmtemplate_fk FOREIGN KEY (template_id) REFERENCES Crmtemplate (crmtemplate_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_group_test_cell_fk FOREIGN KEY (test_cell_id) REFERENCES Group_test_cell (test_cell_id);
ALTER TABLE Campaignevent ADD CONSTRAINT campaignevent_promotion_codes_fk FOREIGN KEY (promotion_code_id) REFERENCES Promotion_codes (promotion_code_id);
ALTER TABLE Campaignitem ADD CONSTRAINT campaignitem_campaigns_fk FOREIGN KEY (campaign_id) REFERENCES Campaigns (campaign_id);
ALTER TABLE Campaignitem ADD CONSTRAINT campaignitem_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Campaignresponse ADD CONSTRAINT campaignresponse_campaignevent_fk FOREIGN KEY (campaign_event_id) REFERENCES Campaignevent (campaign_event_id);
ALTER TABLE Campaignresponse ADD CONSTRAINT campaignresponse_contacts_fk FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id);
ALTER TABLE Campaignresponse ADD CONSTRAINT campaignresponse_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Campaignresponsehistory ADD CONSTRAINT campaignresponsehistory_campaignresponse_fk FOREIGN KEY (campaign_response_id) REFERENCES Campaignresponse (campaign_response_id);
ALTER TABLE Campaignresponsehistory ADD CONSTRAINT campaignresponsehistory_entity_fk FOREIGN KEY (author) REFERENCES Entity (entity_id);
ALTER TABLE Campaignresponsehistory ADD CONSTRAINT campaignresponsehistory_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Case_stage_changes ADD CONSTRAINT case_stage_changes_support_incidents_fk FOREIGN KEY (case_id) REFERENCES Support_incidents (case_id);
ALTER TABLE Caseescalationhistory ADD CONSTRAINT caseescalationhistory_entity_fk FOREIGN KEY (escalator_id) REFERENCES Entity (entity_id);
ALTER TABLE Caseescalationhistory ADD CONSTRAINT caseescalationhistory_entity_fk_2 FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Caseescalationhistory ADD CONSTRAINT caseescalationhistory_support_incidents_fk FOREIGN KEY (case_id) REFERENCES Support_incidents (case_id);
ALTER TABLE Charges ADD CONSTRAINT charges_billing_schedule_descriptions_fk FOREIGN KEY (billing_schedule_id) REFERENCES Billing_schedule_descriptions (billing_schedule_id);
ALTER TABLE Classes ADD CONSTRAINT classes_classes_fk FOREIGN KEY (parent_id) REFERENCES Classes (class_id);
ALTER TABLE Companies ADD CONSTRAINT companies_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Companies ADD CONSTRAINT companies_subsidiaries_fk FOREIGN KEY (subsidiary) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Consolidated_exchange_rates ADD CONSTRAINT consolidated_exchange_rates_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Consolidated_exchange_rates ADD CONSTRAINT consolidated_exchange_rates_from_subsidiaries_fk FOREIGN KEY (from_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Consolidated_exchange_rates ADD CONSTRAINT consolidated_exchange_rates_to_subsidiaries_fk FOREIGN KEY (to_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Contact_types ADD CONSTRAINT contact_types_entity_fk FOREIGN KEY (contact_id) REFERENCES Entity (entity_id);
ALTER TABLE Contact_types ADD CONSTRAINT contact_types_entity_fk_2 FOREIGN KEY (owner_id) REFERENCES Entity (entity_id);
ALTER TABLE Currency_exchange_rates ADD CONSTRAINT currency_exchange_rates_currency_exchange_rate_types_fk FOREIGN KEY (currency_rate_type_id) REFERENCES Currency_exchange_rate_types (currency_rate_type_id);
ALTER TABLE Currency_exchange_rates ADD CONSTRAINT currency_exchange_rates_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Currencyrates ADD CONSTRAINT currencyrates_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Customers ADD CONSTRAINT customers_accounting_periods_fk FOREIGN KEY (first_sale_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Customers ADD CONSTRAINT customers_accounting_periods_fk_2 FOREIGN KEY (last_sale_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Customers ADD CONSTRAINT customers_accounts_fk FOREIGN KEY (default_receivables_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Customers ADD CONSTRAINT customers_billing_rate_cards_fk FOREIGN KEY (billing_rate_card_id) REFERENCES Billing_rate_cards (billing_rate_card_id);
ALTER TABLE Customers ADD CONSTRAINT customers_billing_schedule_descriptions_fk FOREIGN KEY (billing_schedule_id) REFERENCES Billing_schedule_descriptions (billing_schedule_id);
ALTER TABLE Customers ADD CONSTRAINT customers_campaigns_fk FOREIGN KEY (lead_source_id) REFERENCES Campaigns (campaign_id);
ALTER TABLE Customers ADD CONSTRAINT customers_contacts_fk FOREIGN KEY (primary_contact_id) REFERENCES Contacts (contact_id);
ALTER TABLE Customers ADD CONSTRAINT customers_contacts_fk_2 FOREIGN KEY (alternate_contact_id) REFERENCES Contacts (contact_id);
ALTER TABLE Customers ADD CONSTRAINT customers_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Customers ADD CONSTRAINT customers_customer_types_fk FOREIGN KEY (customer_type_id) REFERENCES Customer_types (customer_type_id);
ALTER TABLE Customers ADD CONSTRAINT customers_employees_fk FOREIGN KEY (project_manager_id) REFERENCES Employees (employee_id);
ALTER TABLE Customers ADD CONSTRAINT customers_entity_fk FOREIGN KEY (converted_to_id) REFERENCES Entity (entity_id);
ALTER TABLE Customers ADD CONSTRAINT customers_entity_fk_2 FOREIGN KEY (converted_to_contact_id) REFERENCES Entity (entity_id);
ALTER TABLE Customers ADD CONSTRAINT customers_entity_fk_3 FOREIGN KEY (sales_rep_id) REFERENCES Entity (entity_id);
ALTER TABLE Customers ADD CONSTRAINT customers_entity_fk_4 FOREIGN KEY (parent_id) REFERENCES Entity (entity_id);
ALTER TABLE Customers ADD CONSTRAINT customers_items_fk FOREIGN KEY (tax_item_id) REFERENCES Items (item_id);
ALTER TABLE Customers ADD CONSTRAINT customers_job_types_fk FOREIGN KEY (job_type_id) REFERENCES Job_types (job_type_id);
ALTER TABLE Customers ADD CONSTRAINT customers_partners_fk FOREIGN KEY (partner_id) REFERENCES Partners (partner_id);
ALTER TABLE Customers ADD CONSTRAINT customers_payment_terms_fk FOREIGN KEY (payment_terms_id) REFERENCES Payment_terms (payment_terms_id);
ALTER TABLE Customers ADD CONSTRAINT customers_project_expense_types_fk FOREIGN KEY (project_expense_type_id) REFERENCES Project_expense_types (project_expense_type_id);
ALTER TABLE Customers ADD CONSTRAINT customers_project_time_approval_types_fk FOREIGN KEY (time_approval_type_id) REFERENCES Project_time_approval_types (project_time_approval_type_id);
ALTER TABLE Customers ADD CONSTRAINT customers_revrecschedules_fk FOREIGN KEY (rev_rec_forecast_template) REFERENCES Revrecschedules (schedule_id);
ALTER TABLE Customers ADD CONSTRAINT customers_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Customers ADD CONSTRAINT customers_subsidiaries_fk_2 FOREIGN KEY (represents_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Customers ADD CONSTRAINT customers_territory_fk FOREIGN KEY (sales_territory_id) REFERENCES Territory (territory_id);
ALTER TABLE Customers ADD CONSTRAINT top_level_customer_fk FOREIGN KEY (top_level_parent_id) REFERENCES Customers (customer_id);
ALTER TABLE Customer_currencies ADD CONSTRAINT customer_currencies_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Customer_currencies ADD CONSTRAINT customer_currencies_customers_fk FOREIGN KEY (customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Customer_subsidiary_map ADD CONSTRAINT customer_subsidiary_map_customers_fk FOREIGN KEY (customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Customer_subsidiary_map ADD CONSTRAINT customer_subsidiary_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Departments ADD CONSTRAINT departments_departments_fk FOREIGN KEY (parent_id) REFERENCES Departments (department_id);
ALTER TABLE Employees ADD CONSTRAINT employees_accounts_fk FOREIGN KEY (def_acct_corp_card_expenses_id) REFERENCES Accounts (account_id);
ALTER TABLE Employees ADD CONSTRAINT employees_billing_classes_fk FOREIGN KEY (billing_class_id) REFERENCES Billing_classes (billing_class_id);
ALTER TABLE Employees ADD CONSTRAINT employees_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Employees ADD CONSTRAINT employees_currencies_fk FOREIGN KEY (def_expense_report_currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Employees ADD CONSTRAINT employees_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Employees ADD CONSTRAINT employees_employee_types_fk FOREIGN KEY (employee_type_id) REFERENCES Employee_types (employee_type_id);
ALTER TABLE Employees ADD CONSTRAINT employees_employees_fk FOREIGN KEY (approver_id) REFERENCES Employees (employee_id);
ALTER TABLE Employees ADD CONSTRAINT employees_employees_fk_2 FOREIGN KEY (supervisor_id) REFERENCES Employees (employee_id);
ALTER TABLE Employees ADD CONSTRAINT employees_job_resource_role_fk FOREIGN KEY (default_job_resource_role_id) REFERENCES Job_resource_role (job_resource_role_id);
ALTER TABLE Employees ADD CONSTRAINT employees_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Employees ADD CONSTRAINT employees_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Employees ADD CONSTRAINT employees_work_calendars_fk FOREIGN KEY (work_calendar_id) REFERENCES Work_calendars (work_calendar_id);
ALTER TABLE Employee_currency_map ADD CONSTRAINT employee_currency_map_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Employee_currency_map ADD CONSTRAINT employee_currency_map_employees_fk FOREIGN KEY (employee_id) REFERENCES Employees (employee_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_billing_classes_fk FOREIGN KEY (billing_class_id) REFERENCES Billing_classes (billing_class_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_customers_fk FOREIGN KEY (customer_id) REFERENCES Customers (customer_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_employees_fk FOREIGN KEY (employee_id) REFERENCES Employees (employee_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_payroll_items_fk FOREIGN KEY (payroll_item_id) REFERENCES Payroll_items (payroll_item_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_price_types_fk FOREIGN KEY (price_type_id) REFERENCES Price_types (price_type_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_service_items_fk FOREIGN KEY (item_id) REFERENCES Service_items (item_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_subsidiaries_fk_2 FOREIGN KEY (billing_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_transaction_lines_fk FOREIGN KEY (transaction_id, transaction_line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Employee_time ADD CONSTRAINT employee_time_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Entity_role_map ADD CONSTRAINT entity_role_map_contacts_fk FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id);
ALTER TABLE Entity_role_map ADD CONSTRAINT entity_role_map_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Entityterritorymap ADD CONSTRAINT entityterritorymap_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Entityterritorymap ADD CONSTRAINT entityterritorymap_territory_fk FOREIGN KEY (territory_id) REFERENCES Territory (territory_id);
ALTER TABLE Expense_accounts ADD CONSTRAINT expense_accounts_accounts_fk FOREIGN KEY (expense_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Expense_amortization_rules ADD CONSTRAINT expense_amortization_rules_accounts_fk FOREIGN KEY (contra_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Expense_categories_subs_map ADD CONSTRAINT expense_categories_subs_map_expense_categories_fk FOREIGN KEY (expense_category_id) REFERENCES Expense_categories (expense_category_id);
ALTER TABLE Expense_categories_subs_map ADD CONSTRAINT expense_categories_subs_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Expense_plan_lines ADD CONSTRAINT expense_plan_lines_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Expense_plan_lines ADD CONSTRAINT expense_plan_lines_accounts_fk FOREIGN KEY (deferred_expense_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Expense_plan_lines ADD CONSTRAINT expense_plan_lines_accounts_fk_1 FOREIGN KEY (expense_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Expense_plan_lines ADD CONSTRAINT expense_plan_lines_expense_plans_fk FOREIGN KEY (plan_id) REFERENCES Expense_plans (plan_id);
ALTER TABLE Expense_plan_lines ADD CONSTRAINT expense_plan_lines_transactions_fk FOREIGN KEY (journal_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Expense_plans ADD CONSTRAINT expense_plans_accounting_books_fk FOREIGN KEY (transaction_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Expense_plans ADD CONSTRAINT expense_plans_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Expense_plans ADD CONSTRAINT expense_plans_expense_amortization_rules_fk FOREIGN KEY (expense_rule_id) REFERENCES Expense_amortization_rules (expense_rule_id);
ALTER TABLE Expense_plans ADD CONSTRAINT expense_plans_revenue_elements_fk FOREIGN KEY (related_revenue_element_id) REFERENCES Revenue_elements (revenue_element_id);
ALTER TABLE Expense_plans ADD CONSTRAINT expense_plans_transaction_lines_fk FOREIGN KEY (transaction_doc_id, transaction_line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Expense_plans ADD CONSTRAINT expense_plans_transactions_fk FOREIGN KEY (related_revenue_arrangement_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_accounts_fk_1 FOREIGN KEY (destination_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_accounts_fk_2 FOREIGN KEY (source_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Global_account_map ADD CONSTRAINT global_account_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Global_inventory_relationships ADD CONSTRAINT global_inventory_relationships_invt_subsidiaries_fk FOREIGN KEY (inventory_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Global_inventory_relationships ADD CONSTRAINT global_inventory_relationships_orig_subsidiaries_fk FOREIGN KEY (originating_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Inbound_shipments ADD CONSTRAINT inbound_shipments_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Income_accounts ADD CONSTRAINT income_accounts_accounts_fk FOREIGN KEY (income_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_accounts_fk_1 FOREIGN KEY (destination_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_accounts_fk_2 FOREIGN KEY (source_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Item_account_map ADD CONSTRAINT item_account_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Item_billing_rates ADD CONSTRAINT item_billing_rates_billing_classes_fk FOREIGN KEY (billing_class_id) REFERENCES Billing_classes (billing_class_id);
ALTER TABLE Item_billing_rates ADD CONSTRAINT item_billing_rates_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Item_billing_rates ADD CONSTRAINT item_billing_rates_price_types_fk FOREIGN KEY (item_price_id) REFERENCES Price_types (price_type_id);
ALTER TABLE Item_billing_rates ADD CONSTRAINT item_billing_rates_service_items_fk FOREIGN KEY (item_id) REFERENCES Service_items (item_id);
ALTER TABLE Item_price_history ADD CONSTRAINT item_price_history_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Item_price_history ADD CONSTRAINT item_price_history_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Item_price_history ADD CONSTRAINT item_price_history_price_types_fk FOREIGN KEY (price_type_id) REFERENCES Price_types (price_type_id);
ALTER TABLE Item_subsidiary_map ADD CONSTRAINT item_subsidiary_map_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Item_subsidiary_map ADD CONSTRAINT item_subsidiary_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Item_vendor_map ADD CONSTRAINT item_vendor_map_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Item_vendor_map ADD CONSTRAINT item_vendor_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Item_vendor_map ADD CONSTRAINT item_vendor_map_vendors_fk FOREIGN KEY (vendor_id) REFERENCES Vendors (vendor_id);
ALTER TABLE Item_vendor_pricing ADD CONSTRAINT item_vendor_pricing_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Item_vendor_pricing ADD CONSTRAINT item_vendor_pricing_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Item_vendor_pricing ADD CONSTRAINT item_vendor_pricing_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Item_vendor_pricing ADD CONSTRAINT item_vendor_pricing_vendors_fk FOREIGN KEY (vendor_id) REFERENCES Vendors (vendor_id);
ALTER TABLE Item_collection_item_map ADD CONSTRAINT item_collection_item_map_item_collections_fk FOREIGN KEY (item_collection_id) REFERENCES Item_collections (item_collection_id);
ALTER TABLE Item_collection_item_map ADD CONSTRAINT item_collection_item_map_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Item_group ADD CONSTRAINT item_group_uom_fk FOREIGN KEY (unit_of_measure_id) REFERENCES Uom (uom_id);
ALTER TABLE Locations ADD CONSTRAINT locations_locations_fk FOREIGN KEY (parent_id) REFERENCES Locations (location_id);
ALTER TABLE Location_costing_groups ADD CONSTRAINT location_costing_groups_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Location_costing_grp_locations ADD CONSTRAINT location_costing_grp_locations_location_costing_groups_fk FOREIGN KEY (location_costing_group_id) REFERENCES Location_costing_groups (location_costing_group_id);
ALTER TABLE Location_costing_grp_locations ADD CONSTRAINT location_costing_grp_locations_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Messagerecipient ADD CONSTRAINT messagerecipient_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Messagerecipient ADD CONSTRAINT messagerecipient_message_fk FOREIGN KEY (message_id) REFERENCES Message (message_id);
ALTER TABLE Notes_system ADD CONSTRAINT notes_system_entity_fk FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE Notes_system ADD CONSTRAINT notes_system_entity_fk_2 FOREIGN KEY (author_id) REFERENCES Entity (entity_id);
ALTER TABLE Notes_system ADD CONSTRAINT notes_system_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Notes_system ADD CONSTRAINT notes_system_notetype_fk FOREIGN KEY (note_type_id) REFERENCES Notetype (note_type_id);
ALTER TABLE Notes_system ADD CONSTRAINT notes_system_transaction_lines_fk FOREIGN KEY (line_transaction_id, line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Notes_system ADD CONSTRAINT notes_system_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Notes_system_custom ADD CONSTRAINT notes_system_custom_entity_fk FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE Notes_system_custom ADD CONSTRAINT notes_system_custom_entity_fk_2 FOREIGN KEY (author_id) REFERENCES Entity (entity_id);
ALTER TABLE Notes_system_custom ADD CONSTRAINT notes_system_custom_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Notes_system_custom ADD CONSTRAINT notes_system_custom_notetype_fk FOREIGN KEY (note_type_id) REFERENCES Notetype (note_type_id);
ALTER TABLE Notes_system_custom ADD CONSTRAINT notes_system_custom_transaction_lines_fk FOREIGN KEY (line_transaction_id, line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Notes_system_custom ADD CONSTRAINT notes_system_custom_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Notes_user ADD CONSTRAINT notes_user_entity_fk FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE Notes_user ADD CONSTRAINT notes_user_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Notes_user ADD CONSTRAINT notes_user_notetype_fk FOREIGN KEY (note_type_id) REFERENCES Notetype (note_type_id);
ALTER TABLE Notes_user ADD CONSTRAINT notes_user_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_campaigns_fk FOREIGN KEY (lead_source_id) REFERENCES Campaigns (campaign_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_company_status_fk FOREIGN KEY (company_status_id) REFERENCES Company_status (company_status_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_coupon_codes_fk FOREIGN KEY (promotion_code_instance_id) REFERENCES Coupon_codes (coupon_code_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_currencies_fk FOREIGN KEY (currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_entity_fk FOREIGN KEY (sales_rep_id) REFERENCES Entity (entity_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_partners_fk FOREIGN KEY (partner_id) REFERENCES Partners (partner_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_payment_terms_fk FOREIGN KEY (payment_terms_id) REFERENCES Payment_terms (payment_terms_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_transactions_fk FOREIGN KEY (reversing_transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Opportunities ADD CONSTRAINT opportunities_winlossreason_fk FOREIGN KEY (win_loss_reason_id) REFERENCES Winlossreason (win_loss_reason_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_entity_fk FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_entity_fk_2 FOREIGN KEY (related_company_id) REFERENCES Entity (entity_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_expense_categories_fk FOREIGN KEY (expense_category_id) REFERENCES Expense_categories (expense_category_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_items_fk_2 FOREIGN KEY (tax_item_id) REFERENCES Items (item_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_payment_methods_fk FOREIGN KEY (payment_method_id) REFERENCES Payment_methods (payment_method_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_payroll_items_fk FOREIGN KEY (payroll_item_id) REFERENCES Payroll_items (payroll_item_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_price_types_fk FOREIGN KEY (price_type_id) REFERENCES Price_types (price_type_id);
ALTER TABLE Opportunity_lines ADD CONSTRAINT opportunity_lines_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Originating_leads ADD CONSTRAINT top_level_originating_lead_fk FOREIGN KEY (top_level_parent_id) REFERENCES Originating_leads (customer_id);
ALTER TABLE Partners ADD CONSTRAINT partners_subsidiaries_fk FOREIGN KEY (subsidiary) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Planned_standard_costs ADD CONSTRAINT planned_standard_costs_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Planned_standard_costs ADD CONSTRAINT planned_standard_costs_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_partners_fk FOREIGN KEY (partner_id) REFERENCES Partners (partner_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_promotion_codes_fk FOREIGN KEY (promotion_code_id) REFERENCES Promotion_codes (promotion_code_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_sales_reps_fk FOREIGN KEY (sales_rep_id) REFERENCES Sales_reps (sales_rep_id);
ALTER TABLE Posting_account_activity ADD CONSTRAINT posting_account_activity_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_partners_fk FOREIGN KEY (partner_id) REFERENCES Partners (partner_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_promotion_codes_fk FOREIGN KEY (promotion_code_id) REFERENCES Promotion_codes (promotion_code_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_sales_reps_fk FOREIGN KEY (sales_rep_id) REFERENCES Sales_reps (sales_rep_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Posting_account_activity_pe ADD CONSTRAINT posting_account_activity_pe_subsidiaries_fk_2 FOREIGN KEY (balance_from_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Price_book_line_intervals ADD CONSTRAINT price_book_line_intervals_price_books_fk FOREIGN KEY (price_book_id) REFERENCES Price_books (price_book_id);
ALTER TABLE Price_book_line_intervals ADD CONSTRAINT price_book_line_intervals_price_plans_fk FOREIGN KEY (price_plan_id) REFERENCES Price_plans (price_plan_id);
ALTER TABLE Price_book_line_intervals ADD CONSTRAINT price_book_line_intervals_price_plans_fk_2 FOREIGN KEY (overage_price_plan_id) REFERENCES Price_plans (price_plan_id);
ALTER TABLE Price_book_line_intervals ADD CONSTRAINT price_book_line_intervals_subscription_plan_lines_fk FOREIGN KEY (plan_line_id) REFERENCES Subscription_plan_lines (plan_line_id);
ALTER TABLE Price_book_line_intervals ADD CONSTRAINT price_book_line_intervals_subscription_plan_lines_fk_2 FOREIGN KEY (usage_multiplier_line_id) REFERENCES Subscription_plan_lines (plan_line_id);
ALTER TABLE Price_tiers ADD CONSTRAINT price_tiers_price_plans_fk FOREIGN KEY (price_plan_id) REFERENCES Price_plans (price_plan_id);
ALTER TABLE Price_books ADD CONSTRAINT price_books_subscription_plans_fk FOREIGN KEY (plan_id) REFERENCES Subscription_plans (plan_id);
ALTER TABLE Project_revenue_rl_plans ADD CONSTRAINT project_revenue_rl_plans_project_revenue_rules_fk FOREIGN KEY (project_revenue_rule_id) REFERENCES Project_revenue_rules (project_revenue_rule_id);
ALTER TABLE Project_revenue_rls_charge_rls ADD CONSTRAINT project_revenue_rls_charge_rls_project_revenue_rules_fk FOREIGN KEY (project_revenue_rule_id) REFERENCES Project_revenue_rules (project_revenue_rule_id);
ALTER TABLE Project_revenue_rules ADD CONSTRAINT project_revenue_rules_billing_rate_cards_fk FOREIGN KEY (billing_rate_card_id) REFERENCES Billing_rate_cards (billing_rate_card_id);
ALTER TABLE Project_revenue_rules ADD CONSTRAINT project_revenue_rules_customers_fk FOREIGN KEY (project_id) REFERENCES Customers (customer_id);
ALTER TABLE Project_revenue_rules ADD CONSTRAINT project_revenue_rules_employees_fk_1 FOREIGN KEY (created_by) REFERENCES Employees (employee_id);
ALTER TABLE Project_revenue_rules ADD CONSTRAINT project_revenue_rules_employees_fk_2 FOREIGN KEY (last_modified_by) REFERENCES Employees (employee_id);
ALTER TABLE Project_revenue_rules ADD CONSTRAINT project_revenue_rules_service_items_fk FOREIGN KEY (service_item_id) REFERENCES Service_items (item_id);
ALTER TABLE Project_templates ADD CONSTRAINT project_templates_billing_rate_cards_fk FOREIGN KEY (template_id) REFERENCES Billing_rate_cards (billing_rate_card_id);
ALTER TABLE Project_templates ADD CONSTRAINT project_templates_employees_fk FOREIGN KEY (project_manager_id) REFERENCES Employees (employee_id);
ALTER TABLE Purchase_charge_rules ADD CONSTRAINT purchase_charge_rules_customers_fk FOREIGN KEY (project_id) REFERENCES Customers (customer_id);
ALTER TABLE Purchase_charge_rules ADD CONSTRAINT purchase_charge_rules_items_fk FOREIGN KEY (mark_up_item_id) REFERENCES Items (item_id);
ALTER TABLE Resource_group_entity_map ADD CONSTRAINT resource_group_entity_map_entity_fk FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Resource_group_entity_map ADD CONSTRAINT resource_group_entity_map_resource_groups_fk FOREIGN KEY (group_id) REFERENCES Resource_groups (resource_group_id);
ALTER TABLE Resource_groups ADD CONSTRAINT resource_groups_entity_fk FOREIGN KEY (resource_group_id) REFERENCES Entity (entity_id);
ALTER TABLE Revaluation ADD CONSTRAINT revaluation_accounts_fk FOREIGN KEY (variance_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Revenue_plan_lines ADD CONSTRAINT revenue_plan_lines_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Revenue_plan_lines ADD CONSTRAINT revenue_plan_lines_accounts_fk FOREIGN KEY (deferral_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Revenue_plan_lines ADD CONSTRAINT revenue_plan_lines_accounts_fk_1 FOREIGN KEY (recognition_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Revenue_plan_lines ADD CONSTRAINT revenue_plan_lines_revenue_plans_fk FOREIGN KEY (plan_id) REFERENCES Revenue_plans (plan_id);
ALTER TABLE Revenue_plan_lines ADD CONSTRAINT revenue_plan_lines_transactions_fk FOREIGN KEY (journal_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Revenue_plan_version_lines ADD CONSTRAINT revenue_plan_version_lines_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Revenue_plan_version_lines ADD CONSTRAINT revenue_plan_version_lines_accounts_fk FOREIGN KEY (deferral_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Revenue_plan_version_lines ADD CONSTRAINT revenue_plan_version_lines_accounts_fk_1 FOREIGN KEY (recognition_account_id) REFERENCES Accounts (account_id);
ALTER TABLE Revenue_plan_version_lines ADD CONSTRAINT revenue_plan_version_lines_revenue_plan_versions_fk FOREIGN KEY (plan_version_id) REFERENCES Revenue_plan_versions (plan_version_id);
ALTER TABLE Revenue_plan_version_lines ADD CONSTRAINT revenue_plan_version_lines_transactions_fk FOREIGN KEY (journal_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Revenue_plan_versions ADD CONSTRAINT revenue_plan_versions_employees_fk FOREIGN KEY (created_by_id) REFERENCES Employees (employee_id);
ALTER TABLE Revenue_plan_versions ADD CONSTRAINT revenue_plan_versions_revenue_plans_fk FOREIGN KEY (plan_id) REFERENCES Revenue_plans (plan_id);
ALTER TABLE Revenue_plans ADD CONSTRAINT revenue_plans_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Revenue_plans ADD CONSTRAINT revenue_plans_revenue_elements_fk FOREIGN KEY (revenue_element_id) REFERENCES Revenue_elements (revenue_element_id);
ALTER TABLE Revenue_plans ADD CONSTRAINT revenue_plans_revenue_recognition_rules_fk FOREIGN KEY (rev_rec_rule_id) REFERENCES Revenue_recognition_rules (rev_rec_rule_id);
ALTER TABLE Revrecschedulelines ADD CONSTRAINT revrecschedulelines_accounting_periods_fk FOREIGN KEY (accounting_period_id) REFERENCES Accounting_periods (accounting_period_id);
ALTER TABLE Revrecschedulelines ADD CONSTRAINT revrecschedulelines_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Revrecschedulelines ADD CONSTRAINT revrecschedulelines_revrecschedules_fk FOREIGN KEY (schedule_id) REFERENCES Revrecschedules (schedule_id);
ALTER TABLE Revrecschedulelines ADD CONSTRAINT revrecschedulelines_transactions_fk FOREIGN KEY (journal_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Role_subsidiary_map ADD CONSTRAINT role_subsidiary_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Sales_reps ADD CONSTRAINT sales_reps_accounts_fk FOREIGN KEY (def_acct_corp_card_expenses_id) REFERENCES Accounts (account_id);
ALTER TABLE Sales_reps ADD CONSTRAINT sales_reps_currencies_fk FOREIGN KEY (def_expense_report_currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Standard_cost_components ADD CONSTRAINT standard_cost_components_items_fk FOREIGN KEY (component_id) REFERENCES Items (item_id);
ALTER TABLE Standard_cost_components ADD CONSTRAINT standard_cost_components_planned_standard_costs_fk FOREIGN KEY (planned_standard_cost_id) REFERENCES Planned_standard_costs (planned_standard_cost_id);
ALTER TABLE States ADD CONSTRAINT states_countries_fk FOREIGN KEY (country_id) REFERENCES Countries (country_id);
ALTER TABLE Subscript_line_price_intervals ADD CONSTRAINT subscript_line_price_intervals_billing_subscription_lines_fk FOREIGN KEY (subscription_line_id) REFERENCES Billing_subscription_lines (subline_id);
ALTER TABLE Subscript_line_price_intervals ADD CONSTRAINT subscript_line_price_intervals_price_plans_fk FOREIGN KEY (price_plan_id) REFERENCES Price_plans (price_plan_id);
ALTER TABLE Subscript_line_price_intervals ADD CONSTRAINT subscript_line_price_intervals_subscription_plan_lines_fk FOREIGN KEY (plan_line_id) REFERENCES Subscription_plan_lines (plan_line_id);
ALTER TABLE Subscription_co_lines ADD CONSTRAINT subscription_co_lines_billing_subscription_lines_fk FOREIGN KEY (subscription_line_id) REFERENCES Billing_subscription_lines (subline_id);
ALTER TABLE Subscription_co_lines ADD CONSTRAINT subscription_co_lines_billing_subscriptions_fk FOREIGN KEY (subscription_id) REFERENCES Billing_subscriptions (subscription_id);
ALTER TABLE Subscription_co_lines ADD CONSTRAINT subscription_co_lines_items_fk FOREIGN KEY (plan_item_id) REFERENCES Items (item_id);
ALTER TABLE Subscription_co_lines ADD CONSTRAINT subscription_co_lines_subscription_change_orders_fk FOREIGN KEY (change_order_id) REFERENCES Subscription_change_orders (change_order_id);
ALTER TABLE Subscription_line_revisions ADD CONSTRAINT subscription_line_revisions_billing_subscription_lines_fk FOREIGN KEY (subscription_line_id) REFERENCES Billing_subscription_lines (subline_id);
ALTER TABLE Subscription_line_revisions ADD CONSTRAINT subscription_line_revisions_price_plans_fk FOREIGN KEY (price_plan_id) REFERENCES Price_plans (price_plan_id);
ALTER TABLE Subscription_line_revisions ADD CONSTRAINT subscription_line_revisions_price_plans_fk_2 FOREIGN KEY (overage_price_plan_id) REFERENCES Price_plans (price_plan_id);
ALTER TABLE Subscription_line_revisions ADD CONSTRAINT subscription_line_revisions_revenue_elements_fk FOREIGN KEY (revenue_element_id) REFERENCES Revenue_elements (revenue_element_id);
ALTER TABLE Subscription_line_revisions ADD CONSTRAINT subscription_line_revisions_subscription_change_orders_fk FOREIGN KEY (change_order_id) REFERENCES Subscription_change_orders (change_order_id);
ALTER TABLE Subscription_plan_lines ADD CONSTRAINT subscription_plan_lines_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Subscription_plan_lines ADD CONSTRAINT subscription_plan_lines_subscription_plan_lines_fk FOREIGN KEY (usage_multiplier_line_id) REFERENCES Subscription_plan_lines (plan_line_id);
ALTER TABLE Subscription_plan_lines ADD CONSTRAINT subscription_plan_lines_subscription_plans_fk FOREIGN KEY (parent_id) REFERENCES Subscription_plans (plan_id);
ALTER TABLE Subscription_change_orders ADD CONSTRAINT subscription_change_orders_billing_subscriptions_fk FOREIGN KEY (subscription_id) REFERENCES Billing_subscriptions (subscription_id);
ALTER TABLE Subscription_change_orders ADD CONSTRAINT subscription_change_orders_employees_fk FOREIGN KEY (requester_id) REFERENCES Employees (employee_id);
ALTER TABLE Subscription_change_orders ADD CONSTRAINT subscription_change_orders_subscription_plans_fk FOREIGN KEY (renewal_subscription_plan_id) REFERENCES Subscription_plans (plan_id);
ALTER TABLE Subscription_change_orders ADD CONSTRAINT subscription_change_orders_subscription_terms_fk FOREIGN KEY (renewal_term_id) REFERENCES Subscription_terms (term_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_income_accounts_fk FOREIGN KEY (income_account_id) REFERENCES Income_accounts (income_account_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_subscription_plans_fk FOREIGN KEY (default_renewal_plan_id) REFERENCES Subscription_plans (plan_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_subscription_terms_fk FOREIGN KEY (initial_term_id) REFERENCES Subscription_terms (term_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_subscription_terms_fk_2 FOREIGN KEY (default_renewal_term_id) REFERENCES Subscription_terms (term_id);
ALTER TABLE Subscription_plans ADD CONSTRAINT subscription_plans_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Subsidiary_class_map ADD CONSTRAINT subsidiary_class_map_classes_fk FOREIGN KEY (class_id) REFERENCES Classes (class_id);
ALTER TABLE Subsidiary_class_map ADD CONSTRAINT subsidiary_class_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Subsidiary_department_map ADD CONSTRAINT subsidiary_department_map_departments_fk FOREIGN KEY (department_id) REFERENCES Departments (department_id);
ALTER TABLE Subsidiary_department_map ADD CONSTRAINT subsidiary_department_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Subsidiary_location_map ADD CONSTRAINT subsidiary_location_map_locations_fk FOREIGN KEY (location_id) REFERENCES Locations (location_id);
ALTER TABLE Subsidiary_location_map ADD CONSTRAINT subsidiary_location_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_case_origins_fk FOREIGN KEY (case_origin_id) REFERENCES Case_origins (case_origin_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_case_types_fk FOREIGN KEY (case_type_id) REFERENCES Case_types (case_type_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_caseissue_fk FOREIGN KEY (case_issue_id) REFERENCES Caseissue (case_issue_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_contacts_fk FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_entity_fk FOREIGN KEY (owner_id) REFERENCES Entity (entity_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_entity_fk_2 FOREIGN KEY (assigned_id) REFERENCES Entity (entity_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_entity_fk_3 FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Support_incidents ADD CONSTRAINT support_incidents_territory_fk FOREIGN KEY (territory_id) REFERENCES Territory (territory_id);
ALTER TABLE Support_reps ADD CONSTRAINT support_reps_accounts_fk FOREIGN KEY (def_acct_corp_card_expenses_id) REFERENCES Accounts (account_id);
ALTER TABLE Support_reps ADD CONSTRAINT support_reps_currencies_fk FOREIGN KEY (def_expense_report_currency_id) REFERENCES Currencies (currency_id);
ALTER TABLE Supportcasehistory ADD CONSTRAINT supportcasehistory_entity_fk FOREIGN KEY (employee_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes ADD CONSTRAINT system_notes_entity_fk FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes ADD CONSTRAINT system_notes_entity_fk_2 FOREIGN KEY (author_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes ADD CONSTRAINT system_notes_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE System_notes ADD CONSTRAINT system_notes_notetype_fk FOREIGN KEY (note_type_id) REFERENCES Notetype (note_type_id);
ALTER TABLE System_notes ADD CONSTRAINT system_notes_transaction_lines_fk FOREIGN KEY (line_transaction_id, line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE System_notes ADD CONSTRAINT system_notes_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_entity_fk FOREIGN KEY (company_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_entity_fk_2 FOREIGN KEY (author_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_entity_fk_3 FOREIGN KEY (customfield_created_by_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_entity_fk_4 FOREIGN KEY (customfield_modified_by_id) REFERENCES Entity (entity_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_items_fk FOREIGN KEY (item_id) REFERENCES Items (item_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_notetype_fk FOREIGN KEY (note_type_id) REFERENCES Notetype (note_type_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_transaction_lines_fk FOREIGN KEY (line_id, line_transaction_id) REFERENCES Transaction_lines (transaction_line_id, transaction_id);
ALTER TABLE System_notes_custom ADD CONSTRAINT system_notes_custom_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Time_based_charge_rules ADD CONSTRAINT time_based_charge_rules_billing_rate_cards_fk FOREIGN KEY (billing_rate_card_id) REFERENCES Billing_rate_cards (billing_rate_card_id);
ALTER TABLE Transactions ADD CONSTRAINT transactions_accounts_fk FOREIGN KEY (acct_corp_card_expenses_id) REFERENCES Accounts (account_id);
ALTER TABLE Transaction_address ADD CONSTRAINT transaction_address_entity_fk FOREIGN KEY (created_by_id) REFERENCES Entity (entity_id);
ALTER TABLE Transaction_address ADD CONSTRAINT transaction_address_entity_fk_2 FOREIGN KEY (last_modified_by_id) REFERENCES Entity (entity_id);
ALTER TABLE Transaction_address ADD CONSTRAINT transaction_address_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_book_map ADD CONSTRAINT transaction_book_map_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Transaction_book_map ADD CONSTRAINT transaction_book_map_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_history ADD CONSTRAINT transaction_history_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Transaction_history ADD CONSTRAINT transaction_history_entity_fk FOREIGN KEY (user_id) REFERENCES Entity (entity_id);
ALTER TABLE Transaction_history ADD CONSTRAINT transaction_history_entity_fk_2 FOREIGN KEY (entity_id) REFERENCES Entity (entity_id);
ALTER TABLE Transaction_history ADD CONSTRAINT transaction_history_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_line_book_map ADD CONSTRAINT transaction_line_book_map_accounting_books_fk FOREIGN KEY (accounting_book_id) REFERENCES Accounting_books (accounting_book_id);
ALTER TABLE Transaction_line_book_map ADD CONSTRAINT transaction_line_book_map_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Transaction_line_book_map ADD CONSTRAINT transaction_line_book_map_revrecschedules_fk FOREIGN KEY (schedule_id) REFERENCES Revrecschedules (schedule_id);
ALTER TABLE Transaction_line_book_map ADD CONSTRAINT transaction_line_book_map_transaction_lines_fk FOREIGN KEY (transaction_id, transaction_line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Transaction_lines ADD CONSTRAINT transaction_lines_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Transaction_lines ADD CONSTRAINT transaction_lines_billing_schedule_descriptions_fk FOREIGN KEY (billing_schedule_id) REFERENCES Billing_schedule_descriptions (billing_schedule_id);
ALTER TABLE Transaction_lines ADD CONSTRAINT transaction_lines_subsidiaries_fk_1 FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Transaction_lines ADD CONSTRAINT transaction_lines_subsidiaries_fk_2 FOREIGN KEY (source_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Transaction_lines ADD CONSTRAINT transaction_lines_transaction_shipping_groups_fk FOREIGN KEY (shipping_group_id, transaction_id) REFERENCES Transaction_shipping_groups (shipping_group_id, transaction_id);
ALTER TABLE Transaction_lines ADD CONSTRAINT transaction_lines_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_links ADD CONSTRAINT transaction_links_applied_transaction_lines_fk FOREIGN KEY (applied_transaction_id, applied_transaction_line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Transaction_links ADD CONSTRAINT transaction_links_applied_transactions_fk FOREIGN KEY (applied_transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_links ADD CONSTRAINT transaction_links_original_transaction_lines_fk FOREIGN KEY (original_transaction_id, original_transaction_line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Transaction_links ADD CONSTRAINT transaction_links_original_transactions_fk FOREIGN KEY (original_transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_shipping_groups ADD CONSTRAINT transaction_shipping_groups_transactions_fk FOREIGN KEY (transaction_id) REFERENCES Transactions (transaction_id);
ALTER TABLE Transaction_tax_detail ADD CONSTRAINT transaction_tax_detail_accounts_fk FOREIGN KEY (account_id) REFERENCES Accounts (account_id);
ALTER TABLE Transaction_tax_detail ADD CONSTRAINT transaction_tax_detail_items_fk FOREIGN KEY (tax_item_id) REFERENCES Items (item_id);
ALTER TABLE Transaction_tax_detail ADD CONSTRAINT transaction_tax_detail_tax_items_fk FOREIGN KEY (tax_item_id) REFERENCES Tax_items (item_id);
ALTER TABLE Transaction_tax_detail ADD CONSTRAINT transaction_tax_detail_transaction_lines_fk FOREIGN KEY (transaction_id, transaction_line_id) REFERENCES Transaction_lines (transaction_id, transaction_line_id);
ALTER TABLE Unlocked_time_periods ADD CONSTRAINT unlocked_time_periods_employees_fk FOREIGN KEY (employee_id) REFERENCES Employees (employee_id);
ALTER TABLE Unlocked_time_periods ADD CONSTRAINT unlocked_time_periods_employees_fk_2 FOREIGN KEY (last_modified_by_id) REFERENCES Employees (employee_id);
ALTER TABLE Vendors ADD CONSTRAINT vendors_employees_fk FOREIGN KEY (time_approver_id) REFERENCES Employees (employee_id);
ALTER TABLE Vendors ADD CONSTRAINT vendors_subsidiaries_fk FOREIGN KEY (subsidiary) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Vendors ADD CONSTRAINT vendors_subsidiaries_fk_2 FOREIGN KEY (represents_subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Vendors ADD CONSTRAINT vendors_vendor_types_fk FOREIGN KEY (vendor_type_id) REFERENCES Vendor_types (vendor_type_id);
ALTER TABLE Vendor_subsidiary_map ADD CONSTRAINT vendor_subsidiary_map_subsidiaries_fk FOREIGN KEY (subsidiary_id) REFERENCES Subsidiaries (subsidiary_id);
ALTER TABLE Vendor_subsidiary_map ADD CONSTRAINT vendor_subsidiary_map_vendors_fk FOREIGN KEY (vendor_id) REFERENCES Vendors (vendor_id);
ALTER TABLE Work_calendar_holidays ADD CONSTRAINT work_calendar_holidays_work_calendars_fk FOREIGN KEY (work_calendar_id) REFERENCES Work_calendars (work_calendar_id);
