

## 📦 Libimobiledevice Integration

We recommend using our customized or trusted fork of **libimobiledevice** for the best compatibility and results.

### 🔗 Recommended Library

➡️ [B9yn8/libimobiledevice on GitHub](https://github.com/B9yn8/libimobiledevice)

> This version has been tested and optimized for better stability, enhanced device support, and reliable communication with iOS devices.

### 📥 Installation Guide

Follow the steps below to install the recommended version:

```bash
# Clone the repository
git clone https://github.com/B9yn8/libimobiledevice.git

# Navigate to the directory
cd libimobiledevice

# Build and install (on Linux/macOS)
./autogen.sh
make
sudo make install
```

✅ Make sure to also install dependencies such as:

* `libusbmuxd`
* `libplist`
* `libimobiledevice-glue`

> For Windows users: Precompiled binaries or WSL (Windows Subsystem for Linux) are recommended.

---

### ⚠️ Important Notes

* Use **only trusted sources** to avoid compatibility issues.
* Avoid mixing different versions of `libimobiledevice` on the same system.
* If you face any errors during installation or usage, make sure the related libraries are also updated and correctly installed.


