# GitHub Copilot Demo Guide 

Please login into Github Copilot Web https://github.com/copilot/

Note: If your repo is in Azure DevOps ,clone it to the local machine and attach as context to Copilot Web.
If your repo is in Github, you can directly attach the repo to Copilot Web.


## Exercise 1 Creating Non-Technical Documentation

### Document Business Rules and Logic

**Prompt for Copilot Web:**
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

## Exercise 2: Creating User-Facing Documentation

###  Generate User Guide

**Prompt for Copilot Web:**
```
Create a comprehensive end-user guide (name as ET_USER_GUIDE.md) for the Expense Tracker application. Include:
- Getting started (registration and login)
- How to add expenses (one-time and recurring)
- Using filters and search
- Understanding categories
- Managing settings
- FAQ section with 5-10 common questions users might have about
Use screenshots placeholders and step-by-step instructions. Write for non-technical end users.
```
---

## Exercise 3: Modernization & Migration Planning

### Generate Modernization Proposal


**Prompt for Copilot Web:**
```
Analyze the ExpenseTracker VB.NET desktop application and create a comprehensive modernization plan document(name as ET_Modernization_Solution_Plan.md) for converting it to a C# ASP.NET Core web application. Include:

1. Executive summary
2. Current state analysis (technology stack, features, limitations)
3. Proposed solution architecture (monolith app, with SQL light inmemory database and form based authentication)
4. Technical requirements (functional for all the features AS IT IS)
Use language suitable for technical teams.Format as a professional markdown document
```

---
