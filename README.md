##Setup instructions

Development is on Windows 10.

###Requirements:

1. XAMPP (version 7.3.1 used for dev) - install from https://www.apachefriends.org/download.html (or from their archives at https://sourceforge.net/projects/xampp/files/).
2. PHP

###Setup:

1. Clone the project to `C:\xampp\htdocs` folder.
2. Open XAMPP Control panel.
3. Start Apache and MySQL services from the control panel.
4. Verify if Apache server is running at http://localhost/dashboard/.
5. Open http://localhost/phpmyadmin to verify if DB is acessible.
6. Set up DBs for DAC, MAC and RBAC:
    
    a. Click on `New` option on the left navigation pane to create new DB. Name it `supermarket`, `supermarket_mac` or `supermarket_rbac` depending on which DB you are importing. Clink on create.

    b. Click on `Import` in the top options.

    c. Choose the sql file available in respective folders.

    d. Click on `Go` to create the DB. It should now be accessible on the left navigation.

7. Visit http://localhost/IS_AccessControl/DAC/ to access DAC implementation. Other implementations are available at respective extensions.
8. Sign in using {Eid: 1, Password:132456} or {Eid: 5, Password:132456}.

If you have any queries, please reach out to me at [](mailto:) or Rahul at [k_rahul_reddy@outlook.com](mailto:k_rahul_reddy@outlook.com).