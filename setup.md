## Database setup
Open the MySQL command-line tool and log in as the root user using your password.

```sh
mysql -u root -p
```
Make a new database called `ecommDboot` where you can store your data.

```sh
create database ecommDboot
```
Set up a new user named `master` with the password `master90`.

```sh
CREATE USER 'master'@'localhost' IDENTIFIED BY 'master90';
```

Give the `master` user full access to the `ecommDboot` database so they can view, add, and modify the data.

```sh
GRANT ALL ON ecommDboot.* TO 'master'@'localhost';
```