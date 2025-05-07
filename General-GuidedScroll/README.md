# **PowerShell Guided Scroll for System Administration Tasks**

*By Helen Najar, Lionheart | Ballad by Dragons*

## **Overview**

This Guided Scroll contains a powerful library of PowerShell commands to support system administrators managing Windows environments. Covering user sessions, Active Directory, ACLs, WMI, and cleanup operations, it’s a trusted companion for those who walk the path of precision and order.

## **Features**

### 🔹 **User Management**

* List users locally and remotely.
* Log off remote sessions by ID.
* Manage stored credentials securely.

### 🔹 **Active Directory Management**

* Unlock accounts and investigate lockouts.
* Retrieve group memberships and user activity logs.
* Detect and export inactive users.

### 🔹 **Permissions & Access Control**

* View and export folder-level permissions.
* Translate SIDs to human-readable names.

### 🔹 **WMI & Service Operations**

* Start, stop, or restart services across systems.
* Query system details with precision.

### 🔹 **System Cleanup**

* Empty recycle bins, clear caches, and analyze disk space.
* Adjust execution policies to fit secure scripting workflows.

---

## **Getting Started**

### **🔹 Prerequisites**

* Windows PowerShell 5.0 or later.
* Admin rights (for some tasks).
* Set execution policy if required:

  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

### **🔹 Usage**

1. Clone or download the repository.
2. Open scripts in VS Code, PowerShell ISE, or your editor of choice.
3. Modify variables as needed and run commands with care.

---

## **Example Snippets**

### **User Management**

```powershell
quser               # List local users
quser /SERVER:Host  # List users on a remote machine
Logoff 3 /SERVER:HostName  # Log off session ID 3 remotely
```

### **Active Directory**

```powershell
Unlock-ADAccount -Identity "UserName"
Get-ADUser -Filter * -Properties "LastLogonDate" | 
  Select SAMAccountName, LastLogonDate | Export-Csv .\LastLogon.csv
```

### **Permissions**

```powershell
Get-Acl "C:\Path" | Format-List
```

### **Services & WMI**

```powershell
Restart-Service -Name "Spooler"
Get-WmiObject Win32_Service | Where { $_.PathName -like "*notepad*" }
```

---

## **Contribution**

Have a useful scroll of your own? Submit a pull request and add your magic to the archive. All thoughtful contributions are welcome.

## **Disclaimer**

This scroll is offered as-is. Please test commands in a non-production realm first and ensure backups exist before enacting change.

---

## **License**

This project is licensed under the [MIT License](https://github.com/balladbydragons/Powershell-Guided-Scrolls/blob/main/LICENSE.md).