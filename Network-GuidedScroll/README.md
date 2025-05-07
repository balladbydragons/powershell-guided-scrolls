# **PowerShell Guided Scroll for Network and Firewall Management**  
*By Helen Najar, Lionheart | Ballad by Dragons*
## **Overview**
 **This is a Guided Scroll, NOT an executable script.** 
It serves as a quick reference for IT administrators, network engineers, and PowerShell users troubleshooting  
network connectivity, firewall settings, VPN access, and system diagnostics in Windows environments.
---
## How to Use This Reference  
- Copy and paste individual commands into **PowerShell** as needed.  
- Commands are grouped into categories for **quick access** to network and firewall tasks.  
- Use the **search (CTRL + F)** to quickly find specific commands.  

---
## Quick Access  
Jump to a section in the script:  
1️⃣ [Basic Network Information](https://github.com/balladbydragons/powershell-guided-scrolls/tree/mains/tree/main/Network-GuidedScroll/Network-GuidedScroll.ps1#L5)  
2️⃣ [DNS & IP Configuration](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L7)  
3️⃣ [Network Connectivity & Troubleshooting](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScrolls.ps#L22)
4️⃣ [Network Reset & Adapter Troubleshooting](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L34)  
5️⃣ [Open Ports & Firewall Rules](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L44)  
6️⃣ [Advanced Diagnostics & Logs](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L56)  
7️⃣ [VPN Troubleshooting & Configuration](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L64)  
8️⃣ [Wireless Network & Wi-Fi Diagnostics](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L82)  
9️⃣ [Additional PowerShell Networking Tools](https://github.com/balladbydragons/Network-GuidedScroll/blob/main/Network-GuidedScroll/Network-GuidedScroll.ps#L88)  
---

## **Features**  

### **🔹 Network Management**  
- **Basic Network Information**: View adapters, IP configurations, DNS, and connection profiles.  
- **Port Checking**: Verify if a port is open on a specific IP address.  
- **Reverse DNS Lookup**: Perform reverse DNS lookups for IP addresses.  
- **Public IP Check**: Retrieve the external public IP of the system.  
- **Network Troubleshooting**:  
  - Ping remote servers or IPs to test connectivity and VPN issues.  
  - Export active TCP connections.  
  - Use `Pathping` and `Tracert` for detailed network analysis.  
  - Flush DNS, reset Winsock, and restart network adapters.  

### **🔹 Firewall Management**  
- **Manage Firewall Profiles**:  
  - Enable/Disable all or specific firewall profiles (**Domain, Public, Private**).  
  - Set custom rules for inbound/outbound actions.  
  - Block inbound traffic on **Public profile**.  
  - Disable firewall on specific interfaces.  
- **Review Firewall Settings**: List current firewall profiles, rules, and exceptions.  

### **🔹 VPN Troubleshooting**  
- **Detect IPv6 Issues**: Check if IPv6 is interfering with VPN-based shared drive access.  
- **Refresh VPN Connection**: Release and renew IP configurations.  
- **Prioritize VPN Traffic**: Adjust **interface metrics** for VPN stability.  
- **Test VPN Server Accessibility**: Check connectivity to VPN gateways.  
- **Resolve Shared Drive Issues Over VPN**: Map drives correctly post-connection.  

---

## **Getting Started**  

### **🔹 Prerequisites**  
- **PowerShell Version**: Windows **PowerShell 5.0+** is recommended.

---

## **Usage**  

### **🔹 Running the Commands**  
1. **Clone or download** the repository.  
2. **Open the script** in **PowerShell ISE** or **VS Code**.  
3. **Modify parameters** (IP addresses, ports) based on your environment.  
4. **Execute the scripts** based on your troubleshooting needs.  

---

## **Examples**  

### **🔹 Basic Network Diagnostics**  
- **Get all active network adapters**  
  ```powershell
  Get-NetAdapter | Format-Table -AutoSize
  ```

- **Check your external/public IP address**  
  ```powershell
  Invoke-RestMethod -Uri "https://api.ipify.org"
  ```

- **Flush DNS cache to resolve connectivity issues**  
  ```powershell
  ipconfig /flushdns
  ```

### **🔹 Network Troubleshooting**  
- **Ping a server continuously** and log results:  
  ```powershell
  ping 8.8.8.8 -t > C:\withVPN.txt
  ```

- **Check if a specific port is open on a remote IP**  
  ```powershell
  New-Object System.Net.Sockets.TcpClient("192.168.1.100", "443")
  ```

- **List all open TCP/UDP connections**  
  ```powershell
  Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State | Format-Table -AutoSize
  ```

### **🔹 Firewall Management**  
- **Enable firewall for all profiles**  
  ```powershell
  Set-NetFirewallProfile -All -Enabled True
  ```

- **Disable firewall on a specific interface**  
  ```powershell
  Set-NetFirewallProfile -Name Public -DisabledInterfaceAliases "Ethernet1"
  ```

- **Allow RDP (Remote Desktop) traffic**  
  ```powershell
  New-NetFirewallRule -DisplayName "Allow RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -Action Allow
  ```

### **🔹  VPN Troubleshooting & Fixes**  
- **Check if system is using IPv6 (which can break shared drive access over VPN)**  
  ```powershell
  ipconfig /all | findstr "IPv6"
  ```

- **Disable IPv6 for VPN connections (fixes shared drive mapping issues)**  
  ```powershell
  Set-NetIPInterface -InterfaceAlias "VPN Connection Name" -AddressFamily IPv6 -Dhcp Disabled
  ```

- **Force refresh of VPN adapter's IP configuration**  
  ```powershell
  ipconfig /release && ipconfig /renew && ipconfig /flushdns
  ```

- **Check if VPN server is reachable**  
  ```powershell
  Test-NetConnection -ComputerName vpn.example.com -Port 443
  ```

- **Check existing shared drive mappings over VPN**  
  ```powershell
  Get-SmbMapping
  ```

- **Clear old shared drive mappings** (fixes VPN access issues)  
  ```powershell
  net use * /delete
  ```

- **Manually remap shared drives after connecting to VPN**  
  ```powershell
  net use X: \\ServerName\SharedFolder /user:Domain\User
  ```

---

## **Contribution**  
**Have improvements or additional use cases?** Feel free to **submit a pull request**! Contributions are welcome.  

---

## **Disclaimer**  
This script is provided **as-is**. Always **test in a controlled environment** before making changes to production systems. Ensure **backups** are in place before modifying **firewall settings** or **network configurations**.  

---

## **License**  
This project is licensed under the [MIT License](https://github.com/balladbydragons/Powershell-Guided-Scrolls/blob/main/LICENSE.md).

Created and maintained by Helen Najar | Lionheart | [BalladByDragons.org](https://www.balladbydragons.org)