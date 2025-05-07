<#
    PowerShell Guided Scroll for O365 and Hybrid Environments
    Author: Helen Najar
    Guided by the hand of a Lionheart — Ballad by Dragons
    Purpose: This script provides essential commands for managing mailboxes, permissions, and other O365/Hybrid tasks.
    Notes: Replace placeholder domains (@domain.com) with your actual domain before running the commands.
#>

# --- Mailbox Management ---
# Example: Enable mailbox for an existing AD account
# Command: Enable-RemoteMailbox
Enable-RemoteMailbox ballad@domain.com -RemoteRoutingAddress ballad@365domain.mail.onmicrosoft.com

# Example: Create a new mailbox along with the AD account
New-RemoteMailbox -Name "<Firstname Lastname>" -Password "<password>" -UserPrincipalName ballad@domain.com -OnPremisesOrganizationalUnit "domain.local/Users"

# --- Permission Management ---
# List user permissions (e.g., SendAs)
Get-RecipientPermission -Trustee "user@email.com"

# Add FullAccess permission to a shared mailbox
Add-MailboxPermission -Identity SHAREDMBX@emaildomain.com -User username@emaildomain.com -AccessRights FullAccess -InheritanceType All

# --- Forwarding Management ---
# Set forwarding for a mailbox
Set-Mailbox -Identity "user@domain.com" -ForwardingAddress "forwardto@domain.com" -DeliverToMailboxAndForward $true

# --- Message Tracing ---
# Trace messages between specific dates
Get-MessageTrackingLog -Start "MM/DD/YYYY 00:00" -End "MM/DD/YYYY 23:59" -Sender sender@email.com -Recipients ballad@domain.com

# --- Distribution Groups ---
# Add a user to a distribution group
Add-DistributionGroupMember -Identity "Staff" -Member "JohnEvans@domain.com"