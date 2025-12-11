       IDENTIFICATION DIVISION.
       PROGRAM-ID. AU-TAX-CALC.
       AUTHOR. Copilot.
 
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-I.
       OBJECT-COMPUTER. IBM-I.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INCOME             PIC S9(9)V99 COMP-3.
       01  WS-DEDUCTIONS         PIC S9(9)V99 COMP-3.
       01  WS-TAXABLE-INCOME     PIC S9(9)V99 COMP-3.
      *    Australian specific tax components
       01  WS-INCOME-TAX         PIC S9(9)V99 COMP-3.
       01  WS-MEDICARE-LEVY      PIC S9(9)V99 COMP-3.
       01  WS-TOTAL-TAX          PIC S9(9)V99 COMP-3.
       01  WS-NET-PAY            PIC S9(9)V99 COMP-3.
 
       01  WS-INPUT-TEMP         PIC X(15).
       01  WS-DISPLAY-MONEY      PIC ZZZ,ZZ9.99.
 
       PROCEDURE DIVISION.
           PERFORM 100-GET-INPUT.
           PERFORM 200-CALCULATE-AU-TAX.
           PERFORM 300-DISPLAY-RESULTS.
           STOP RUN.
 
       100-GET-INPUT.
           DISPLAY "--- Australian Tax Calculator (2024-2025) ---".
           DISPLAY "Enter Annual Gross Income (AUD): ".
           ACCEPT WS-INPUT-TEMP.
           MOVE WS-INPUT-TEMP TO WS-INCOME.
           DISPLAY "Enter Total Deductions (Work-related, gifts): ".
           ACCEPT WS-INPUT-TEMP.
           MOVE WS-INPUT-TEMP TO WS-DEDUCTIONS.
           .
 
       200-CALCULATE-AU-TAX.
      *    Calculate Taxable Income
           COMPUTE WS-TAXABLE-INCOME = WS-INCOME - WS-DEDUCTIONS.
 
           IF WS-TAXABLE-INCOME < 0
               MOVE 0 TO WS-TAXABLE-INCOME
           END-IF.
 
      *    --- Income Tax Calculation (2024-25 Resident Rates) ---
           IF WS-TAXABLE-INCOME <= 18200
               MOVE 0 TO WS-INCOME-TAX
           ELSE IF WS-TAXABLE-INCOME <= 45000
               COMPUTE WS-INCOME-TAX = (WS-TAXABLE-INCOME - 18200) * 0.16
           ELSE IF WS-TAXABLE-INCOME <= 135000
               COMPUTE WS-INCOME-TAX = 4288 + 
                       ((WS-TAXABLE-INCOME - 45000) * 0.30)
           ELSE IF WS-TAXABLE-INCOME <= 190000
               COMPUTE WS-INCOME-TAX = 31288 + 
                       ((WS-TAXABLE-INCOME - 135000) * 0.37)
           ELSE
               COMPUTE WS-INCOME-TAX = 51638 + 
                       ((WS-TAXABLE-INCOME - 190000) * 0.45)
           END-IF.
 
      *    --- Medicare Levy (Standard 2% for 2024-25) ---
      *    Note: Simplified. Does not fully handle the "shading-in" range
      *    between $26,000 and $32,500, nor Family Tax Benefit reductions.
           IF WS-TAXABLE-INCOME > 27222
               COMPUTE WS-MEDICARE-LEVY = WS-TAXABLE-INCOME * 0.02
           ELSE
               MOVE 0 TO WS-MEDICARE-LEVY
           END-IF.
 
      *    --- Total PAYG / Tax Liability ---
           COMPUTE WS-TOTAL-TAX = WS-INCOME-TAX + WS-MEDICARE-LEVY.
           COMPUTE WS-NET-PAY = WS-INCOME - WS-TOTAL-TAX.
           .
 
       300-DISPLAY-RESULTS.
           DISPLAY " ".
           DISPLAY "--- ATO Tax Estimate Summary ---".
           MOVE WS-INCOME TO WS-DISPLAY-MONEY.
           DISPLAY "Gross Income:      $" WS-DISPLAY-MONEY.
           MOVE WS-DEDUCTIONS TO WS-DISPLAY-MONEY.
           DISPLAY "Deductions:        $" WS-DISPLAY-MONEY.
           MOVE WS-TAXABLE-INCOME TO WS-DISPLAY-MONEY.
           DISPLAY "Taxable Income:    $" WS-DISPLAY-MONEY.
           DISPLAY "--------------------------------".
           MOVE WS-INCOME-TAX TO WS-DISPLAY-MONEY.
           DISPLAY "Income Tax:        $" WS-DISPLAY-MONEY.
           MOVE WS-MEDICARE-LEVY TO WS-DISPLAY-MONEY.
           DISPLAY "Medicare Levy (2%):$" WS-DISPLAY-MONEY.
           DISPLAY "--------------------------------".
 
           MOVE WS-TOTAL-TAX TO WS-DISPLAY-MONEY.
           DISPLAY "Total Tax Payable: $" WS-DISPLAY-MONEY.
           MOVE WS-NET-PAY TO WS-DISPLAY-MONEY.
           DISPLAY "Est. Net Pay:      $" WS-DISPLAY-MONEY.
