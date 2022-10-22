CREATE VIEW [ctl_Investor].[VwInvestorImport]
AS
  SELECT	x.[OldMemberNumber] AS [OriginalMemberNumber]
          ,SUBSTRING(x.[LoanId], 0, CHARINDEX('-', x.[LoanId])) +
            '-' +
            cast(x.[OldMemberNumber] as nvarchar(20)) + cast(x.[LoanNumber] as nvarchar(20))
            AS [OriginalLoanId]
          ,x.[MemberNumber] as [MemberNumber]
          ,x.[LoanId]
  FROM	[ctl_Investor].[InvestorImport] x
;