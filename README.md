# Network-Security-Design-and-Segmentation

## Overview

This repository contains a network security design assignment completed as part of the
Cyber Nation x Protexxa Cybersecurity Bootcamp. The assignment required designing a
secure, segmented, and scalable network for a small company with fewer than 100
computers. The design was implemented in Cisco Packet Tracer and covers VLAN
segmentation, firewall rules, subnetting, inter-department communication strategies,
and redundancy planning.

<img src="https://github.com/AhndreWalters/Network-Security-Design-and-Segmentation/blob/main/Ahndre%20Walters%20Assignment%203%20Networking%20Topology.png">

## Company Structure

The network was designed to support the following six departments:

- Management and CEO
- Finance and Accounts
- Marketing (ethernet and wireless)
- Information Technology
- Research and Development
- Guest (wireless only)

## Objectives

- Isolate each department using VLANs to enforce the principle of least privilege.
- Design a scalable network that supports future growth with minimal reconfiguration.
- Minimize single points of failure through redundancy in core devices.
- Deploy essential servers including Mail, Application, DNS, and DHCP.
- Define and justify a minimum of ten firewall rules including three mandatory rules.
- Perform subnetting calculations using a /27 subnet mask.
- Identify inter-department communication strategies that maintain security and
  segmentation.

## Firewall Rules

### Mandatory Rules

**Deny pings from the internet**
Blocks ICMP Echo Requests to prevent reconnaissance activities such as ping sweeps,
which attackers use to map active systems and gather network intelligence before
launching an attack.

**Deny mail leaving the R&D subnet**
R&D departments handle sensitive and proprietary information. Blocking outgoing mail
prevents accidental or intentional data exfiltration and enforces internal data
handling policies.

**Deny internet requests to R&D**
Prevents direct external access to the R&D VLAN, reducing the attack surface and
protecting research data from targeted threats or malware delivery.

### Additional Firewall Rules

| Rule | Action | Justification |
|---|---|---|
| Guest VLAN to all internal VLANs | Deny | Guest devices are untrusted and must be fully isolated from internal systems |
| DNS, DHCP, HTTP/HTTPS from user VLANs to Server VLAN | Allow | Core services must be accessible to all internal departments for normal operations |
| IP phone VLAN to internet | Deny | Restricts voice traffic to the internal network to prevent toll fraud and eavesdropping |
| SSH and Telnet into networking devices | Allow IT VLAN only | Limits administrative access to network infrastructure to the IT department only |
| Inbound HTTP port 80 from internet to internal VLANs | Deny | Forces encrypted HTTPS traffic and prevents exposure of internal services to unencrypted requests |
| Finance VLAN to App Server | Allow port 443 only | Restricts Finance access to encrypted application traffic only, reducing unnecessary exposure |
| Marketing VLAN to R&D VLAN | Deny | Prevents cross-department access to sensitive research data from a department with external-facing activity |

## Printer and IP Phone Exceptions

**Guest (Wireless)**
Guest VLANs are designed for temporary and untrusted devices. Introducing permanent
assets such as printers or IP phones into this segment increases the attack surface and
exposes internal hardware to unknown devices. All guest traffic is isolated by default.

**Research and Development**
R&D handles confidential intellectual property. Minimizing the number of connected
devices reduces the number of potential attack vectors and ensures tighter control over
data access. The focus is on minimal exposure and strict device management.

## Subnetting

The /27 subnet mask was applied to calculate department address ranges.

- **Number of subnets:** 8
- **Usable hosts per subnet:** 30

| Network ID | First Usable Host | Last Usable Host | Broadcast |
|---|---|---|---|
| 192.168.40.0 | 192.168.40.1 | 192.168.40.30 | 192.168.40.31 |
| 192.168.40.32 | 192.168.40.33 | 192.168.40.62 | 192.168.40.63 |
| 192.168.40.64 | 192.168.40.65 | 192.168.40.94 | 192.168.40.95 |
| 192.168.40.96 | 192.168.40.97 | 192.168.40.126 | 192.168.40.127 |
| 192.168.40.128 | 192.168.40.129 | 192.168.40.158 | 192.168.40.159 |

These subnets are assigned per department, ensuring logical separation while leaving
address space available for future growth.

## Inter-Department Communication Strategies

**Access Control Lists (ACLs)**
ACLs filter traffic between VLANs based on source and destination IP address and port
number. For example, the IT department can be granted access to all VLANs for
administrative purposes while Finance is restricted to reaching only the Application
Server on a specific port.

**Router-on-a-Stick with Inter-VLAN Routing**
A router configured with sub-interfaces for each VLAN enables controlled communication
between departments. Combined with firewall rules and ACLs, this method maintains
logical segmentation while permitting only the traffic that is explicitly required for
business operations.

**Authentication and Role-Based Access Control (RBAC)**
Centralized authentication using RADIUS or TACACS+ ensures that only authorized
personnel can access specific systems and network resources. Combined with VLAN
restrictions and access logging, RBAC enforces consistent security policies across all
departments.

## Design Summary

| Element | Implementation |
|---|---|
| Segmentation | All six departments use distinct VLANs for traffic isolation |
| Scalability | /27 subnetting supports 30 hosts per subnet with room for expansion |
| Redundancy | Modular core router and switch layout designed for failover |
| Servers | Mail, DNS, DHCP, and App servers placed in a dedicated Server VLAN |
| Guest Isolation | Guest wireless traffic fully separated from all internal VLANs |
| Firewall Rules | Ten rules implemented with technical and business justification |
| Packet Tracer | All device links functional with no errors |

## License

This project is for academic purposes only and is not affiliated with any real company
or organization. All network designs, firewall rules, and configurations are theoretical
applications created for educational use.

<strong>[&copy; 2025 Ahndre Walters](https://github.com/AhndreWalters/Network-Security-Design-and-Segmentation/blob/main/LICENSE) · Created as part of the Cyber Nation x Protexxa Cybersecurity Bootcamp (Cohort 1 - Grenada) · Assignment 3 · Network Security Design</strong>
