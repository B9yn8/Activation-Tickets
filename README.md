# 🔓 Generate Activation Files Tool

A lightweight and simple batch script for generating iOS-style `activation_record.plist` files.  
This tool is useful for educational and testing purposes, particularly for creating dummy activation records for iOS devices.

---

## 🚀 Features

- Generates valid `.plist` XML structure compatible with iOS activation systems.
- Takes device info from the user (Serial, Model, IMEI, UDID).
- Saves each activation record in its own folder named after the device's serial number.

---

## 🧰 Requirements

- Windows OS (Tested on Windows 10 & 11)
- Basic command prompt access (`cmd`)
- No dependencies or installations required

---

## ⚙️ Usage

### Step-by-step:

1. Download or clone the repository:
   ```bash
   git clone https://github.com/B9yn8/Activation-Tickets.git
   cd activation-plist-generator
  

2. Run the script:

   * Double-click `Generate Activation Files.bat`
   * Or open `cmd` in the folder and type:

     ```bash
     Generate Activation Files.bat
     ```

3. Input the requested information when prompted:

   * Serial Number
   * Model (e.g., iPhone10,3)
   * UDID
   * IMEI

4. A folder will be created using the serial number as its name.
   Inside, you'll find the generated `activation_record.plist`.

---

## 📂 Output Example

**Folder:**

```
/G0NXXXXX
    └── activation_record.plist
```

**activation\_record.plist:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>IMEI</key>
    <string>356789012345678</string>
    <key>PRODUCT_TYPE</key>
    <string>iPhone10,3</string>
    <key>SERIAL_NUMBER</key>
    <string>G0NXXXXX</string>
    <key>UniqueDeviceID</key>
    <string>00008030-001C195E0A87802E</string>
</dict>
</plist>
```

---

## ❗ Notes

* This tool does not activate iPhones or bypass iCloud by itself.
* It only creates a file structure that can be used in further development or educational testing.
* Make sure to use this tool only on devices you own or have authorization for.

---

## 📜 LEGAL NOTICE & DISCLAIMER

Welcome to this channel! Please read the following legal notice carefully before using or sharing any content from this channel.

---

### 🔐 Educational Purpose Only

All tools, software, methods, and guides shared in this channel are strictly for educational and informational purposes.
We do not promote or encourage any illegal activity, unauthorized access, or use of stolen devices.
This content is intended to help individuals who:

* Have lost access to their own iCloud accounts or MDM profiles.
* Are legally authorized to perform bypass or recovery on their own devices.
* Want to learn about iOS security, development, and ethical testing for educational or research purposes.

---

### 🧾 Copyright Disclaimer – Fair Use Act Notice

> Copyright Disclaimer under Section 107 of the Copyright Act 1976
> Allowance is made for “fair use” for purposes such as criticism, comment, news reporting, teaching, scholarship, and research.
> Fair use is a use permitted by copyright statute that might otherwise be infringing.
> Non-profit, educational or personal use tips the balance in favor of fair use.

All logos, trademarks, and brand names used in tools or media belong to their respective owners. We do not claim ownership of any iOS firmware, Apple services, or Apple branding.

---

### 📄 DMCA Compliance

Under the Digital Millennium Copyright Act (DMCA), jailbreaking or rooting a device for personal, non-commercial use is legal in many jurisdictions. This channel provides resources for legal modification of devices owned by the user or with proper consent.

We do not support bypassing for commercial exploitation or resale of stolen devices. Any user who misuses the information or tools provided is solely responsible for their actions.

---

### 📦 Commercial Tools & Cloud Services

Some services provided may include a paid component to cover server costs, licensing, cloud computing, or tool maintenance.
These fees are not for profit, but necessary to maintain continuous service and support. We do not sell stolen or illegal content.

---

### ❌ Disclaimer of Liability

By using any of the information or tools shared here:

* You agree that your actions are your sole responsibility.
* We are not responsible for any misuse, data loss, or legal issues caused by improper use.
* This channel and its administrators are not liable for actions performed using shared tools or knowledge.

---

### 📢 Final Notes

This channel:

* Does not promote piracy
* Does not distribute paid Apple content
* Does not bypass security for profit or resale
* Exists solely to educate and support users in legitimate recovery scenarios.

If you believe any content violates your rights, please contact us directly and we will respond in full cooperation under applicable laws.

---

© 2025 **BELLI AIO UNLOCKER** – All Rights Reserved
* Buy Me a Cofee :
* ```USDT-TRC20 THbrJSW4keFSbWHJGfPataZ9G8sHNCNqPD```
* For support: [@ZP_H3](https://t.me/ZP_H3)
* GitHub: [https://github.com/B9yn8](https://github.com/B9yn8)
* Website: [https://belliactivator.vercel.app](https://belliactivator.vercel.app)
* YouTube: [https://www.youtube.com/@BELLIDEV](https://www.youtube.com/@BELLIDEV)
* OfficialBoT: [@newSignalBOBOT](https://t.me/newSignalBOBOT)

