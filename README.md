# 🔄 Smart Backup Tool

**A Windows Batch utility that intelligently mirrors folders. It calculates file sizes, shows a preview of what will be transferred, and asks for confirmation before copying.**

---

## 🛠 Features
* **Smart Sync:** Only copies new or modified files (skips files that are already up-to-date).
* **Live Preview:** Lists every file pending transfer with its full path.
* **Size Calculation:** Automatically calculates and displays file sizes in **GB, MB, KB, or Bytes** for clarity.
* **Safety Check:** Requires a `Y/N` confirmation before any data is moved.

---

## 🚀 How to Setup

### 1. Configure Your Paths
Before running the tool, you must tell it which folders to sync.

1.  Right-click the `backup.bat` file and select **Edit** (or open with Notepad).
2.  Find these two lines at the top:
    ```batch
    set "SRC=D:\Your\Source\Folder"
    set "DST=G:\Your\Destination\Folder"
    ```
3.  Replace the paths inside the quotes with your actual folders.
4.  Save and close the file.

---

## 📌 How to Pin to Start Menu

Since this is a custom script, you need to create a specific shortcut to pin it like a real app.

1.  Open the **Run** dialog (press `Win + R`).
2.  Paste the following path and press **Enter**:
    ```text
    %AppData%\Microsoft\Windows\Start Menu\Programs
    ```
3.  In the folder that opens, **Right-click > New > Shortcut**.
4.  Click **Browse**, select your `backup.bat` file, and click **OK**.
5.  Click **Next**, name it **"Backup Tool"** (or your preferred name), and click **Finish**.
6.  Open your **Start Menu**, search for "Backup Tool", right-click the icon, and select **Pin to Start**.

---

## 🎨 How to Change the Icon

To make the tool look professional, you can replace the default system icon with a custom `.ico` file.

1.  Go to the **Start Menu Programs** folder where you created the shortcut (from Step 2 above).
2.  **Right-click** the "Backup Tool" shortcut and select **Properties**.
3.  Go to the **Shortcut** tab and click the **Change Icon...** button.
    * *Note: If a warning appears saying the file contains no icons, just click OK.*
4.  Click **Browse** and locate your `.ico` file.
5.  Select the icon, click **OK**, then click **Apply** and **OK**.
