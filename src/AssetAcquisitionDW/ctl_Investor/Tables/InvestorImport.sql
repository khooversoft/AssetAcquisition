CREATE TABLE [ctl_Investor].[InvestorImport]
(
	[RowId]           uniqueidentifier not null,
	[MonthEndDate]    bigint not null,
	[MemberNumber]    bigint not null,
	[OldMemberNumber] bigint not null,
	[LoanNumber]      bigint not null,
	[LoanId]          varchar(50) not null
)
