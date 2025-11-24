# Explorer:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![Explorer](https://github.com/user-attachments/assets/46a27a12-b1f1-49d2-ad96-e84cb3614ee7)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![112025](https://github.com/user-attachments/assets/6c049038-ad2c-4fe3-9b7e-1ca8154910c2)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

File Explorer, previously known as Windows Explorer, is a [file manager](https://en.wikipedia.org/wiki/File_manager) application and default [desktop environment](https://en.wikipedia.org/wiki/Desktop_environment) that is included with releases of the Microsoft Windows operating system from Windows 95 onwards. It provides a graphical user interface for accessing the [file systems](https://en.wikipedia.org/wiki/File_system), as well as user interface elements such as the [taskbar](v) and desktop.

The application was renamed from "Windows Explorer" to "File Explorer" in Windows 8; however, the old name of "Windows Explorer" can still be seen in the Windows Task Manager.

</br>

![Explorer](https://github.com/user-attachments/assets/500ee939-9df4-4132-b86c-b868f1cdeda7)

</br>

File Explorer is the default user interface for accessing and managing the file systems, but it is possible to perform such tasks on Windows without File Explorer. For example, the File ▸ Run menu option in Task Manager on Windows NT or later functions independently of File Explorer, as do commands run within a [command prompt](https://en.wikipedia.org/wiki/Command-line_interface#Command_prompt) window.

After a user logs in, the explorer process is created by the userinit process. Userinit performs some initialization of the user environment (such as running the login script and applying group policies) and then looks in the registry at the Shell value and creates a process to run the system-defined shell – by default, Explorer.exe. Then Userinit exits. This is why Explorer.exe is shown by various process explorers with no parent – its parent has exited.

# Instructions:
This is a basic project that can be integrated into any Delphi project as a file manager. It includes some fundamental functions such as copying, deleting, moving, and renaming. The code can be extended or reduced as needed. The project can also assign access rights to the user, which are currently disabled in the code. This is for good reason, as the code can grant or deny access rights. Therefore, it's important to familiarize yourself with this to avoid accidentally locking folders or entire hard drives.

# Main functions and tasks:
* Navigation: Browsing directories and file systems using a graphical user interface (GUI).
* File management: Performing basic operations such as copying, moving, deleting, and renaming files and folders.
* Creation: Creating new folders and files.
* Managing external storage media: Accessing and organizing data on external drives, such as USB sticks or external hard drives.
* Metadata editing: Changing file properties such as attributes or permissions.

</br>

This is a dual-pane file manager, where the file is navigated on the left and execution is performed on the right.

