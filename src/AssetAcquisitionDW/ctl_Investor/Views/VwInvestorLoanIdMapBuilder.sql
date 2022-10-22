CREATE VIEW [ctl_Investor].[VwInvestorLoanIdMapBuilder]
AS
  with mapping
  AS
  (
    SELECT	DISTINCT
        x.[OriginalMemberNumber]
        ,x.[OriginalLoanId]
        ,x.[MemberNumber]
        ,x.[LoanId]

    FROM	[ctl_Investor].[VwInvestorImport] x
    WHERE	NOT EXISTS (SELECT * FROM [ctl_Investor].[VwInvestorImport] i WHERE x.[OriginalLoanId] = i.[LoanId])

    UNION ALL

    SELECT	m.[OriginalMemberNumber]
        ,m.[OriginalLoanId]
        ,x.[MemberNumber]
        ,x.[LoanId]
    FROM	mapping m
        inner join [ctl_Investor].[VwInvestorImport] x on m.[LoanId] = x.[OriginalLoanId]
  )
  select * from mapping
;