# MPP Furniture Shop
Тема проекту для лабораторних робіт: Онлайн магазин меблевий  
Автори: Мішуров Михайло КС33, Петренко Дмитро КС33

## Діаграми
![ERD](diagram.png "ER-діаграма")

## Скрипти
- parsing.rb - зібрати дані про лікарні і створити data.csv  
- categories.rake - заповнити базу категоріями товарів  
- products.rake - заповнити базу товарами

## Запуск проекту
Встановлення гемів:
```
bundle install
```
Створення і заповнення бази даних:
```
rails db:create
rails db:migrate
rake categories
rake products
```
Запуск сервера:
```rails s```
