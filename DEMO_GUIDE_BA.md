# GitHub Copilot Demo Guide - Business Analyst (Sarah)

## Persona: Sarah - Business Analyst

**Scenario Overview:**  
Sarah is a business analyst working with an existing VB.NET and C# codebase (Expense Tracker application). She needs to understand how the code functions in order to help design changes and provide documentation to the product team. To achieve this, Sarah plans to add comments and generate documentation for the legacy code.
---
## Prerequisites

- GitHub Copilot enabled in VS Code
- Expense Tracker VB.NET project open in VS Code
- Familiarity with VS Code and GitHub Copilot Chat
---

## Part 1: Adding Comments to Code (Documenting Methods & Functions)

### Step 1.1: Add Documentation to AuthenticationService

**File to Open:** `ExpenseTracker/Services/AuthenticationService.vb`

**Prompt for Copilot Chat:**
```
What is this project about? give a summary and tech stack details briefly and also start the application from command line
```

```
Add comments in plain text to all the methods in ExpenseTracker/Services/AuthenticationService.vb. Include:
- Summary of what each method does
- Parameter descriptions
- Return value descriptions
- Example usage where helpful
```

---

### Step 1.2: Document Complex Business Logic in ExpenseService

**File to Open:** `ExpenseTracker/Services/ExpenseService.vb`

**Prompt for Copilot Chat:**
```
Add detailed comments explaining the recurring expense logic in the GetExpensesWithRecurring method located in ExpenseTracker/Services/ExpenseService.vb  Help non-developers understand:
- What recurring expenses are
- How they're expanded
- Why we filter by date ranges
```

**Demo Talking Points:**
- "This recurring expense logic is complex - I need to explain it to the product team"
- "Copilot helps me add business-focused comments, not just technical ones"
- "Now I can create user stories based on this understanding"

---

## Part 2: Creating Non-Technical Documentation

### Step 2.1: Document Business Rules and Logic

**Prompt for Copilot Chat:**
```
Analyze the ExpenseTracker codebase and create a "Business Rules" document that lists:
- User authentication rules (password requirements, username constraints)
- Expense entry rules (required fields, data validation)
- Recurring expense rules (frequencies, date ranges)
- Single currency support (AUD)
- Tax deduction tracking rules

Write this for a business analyst or product manager, not a developer.
```

---

## Part 3: Creating User-Facing Documentation

### Step 3.1: Generate User Guide

**Prompt for Copilot Chat:**
```
Create a comprehensive end-user guide (name as ET_USER_GUIDE.md) for the Expense Tracker application. Include:
- Getting started (registration and login)
- How to add expenses (one-time and recurring)
- Using filters and search
- Understanding categories and currency (AUD)
- Managing settings
- FAQ section with 5-10 common questions users might have about
Use screenshots placeholders and step-by-step instructions. Write for non-technical end users.
```
---

## Part 6: Modernization & Migration Planning

### Step 6.1: Generate Modernization Proposal

**Scenario:** Leadership wants to modernize the VB.NET desktop app to a C# .NET web application

**Prompt for Copilot Chat:**
```
Analyze the ExpenseTracker VB.NET desktop application and create a comprehensive modernization proposal document(name as ExpenseTracker_Modernization_Proposal.md) for converting it to a C# ASP.NET Core web application. Include:

Analyze the ExpenseTracker VB.NET desktop application and create a comprehensive modernization  design for converting it to a C# /.Net web application. Include:

1. Executive summary with key benefits
2. Current state analysis (technology stack, features, limitations)
3. Proposed solution architecture (monolith app, with SQL light inmemory database and form based authentication)
4. Technical requirements (functional for all the features AS IT IS)

Use language suitable for technical teams.
Format as a professional markdown document with a name of ET_Modernization_Solution_Proposal.md.
```

---
