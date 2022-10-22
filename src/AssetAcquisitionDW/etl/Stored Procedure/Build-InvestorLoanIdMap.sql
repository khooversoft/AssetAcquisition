CREATE PROCEDURE [etl].[Build-InvestorLoanIdMap]
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE [ctl_Investor].[InvestorLoanIdMap];

    INSERT INTO [ctl_Investor].[InvestorLoanIdMap]
    (
        [OriginalMemberNumber]
        ,[OriginalLoanId]
        ,[MemberNumber]
        ,[LoanId]
    )
    SELECT  x.[OriginalMemberNumber]
            ,x.[OriginalLoanId]
            ,x.[MemberNumber]
            ,x.[LoanId]
    FROM    [ctl_Investor].[VwInvestorLoanIdMapBuilder] x
    ;
END
    