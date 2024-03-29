﻿#language: ru

@tree
@exportScenarios
@IgnoreOnCIMainBuild

Функционал: проверка заполнения, проведения и движений документа "Продажи товаров"

Как тестировщик я хочу
Создать, заполнить и провести документ
чтобы проверить функционал  

Сценарий: Создание и проведение документа
* Создание и заполнение шапки документа
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Шлюзовая ООО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
* Заполнение ТЧ "Товары" и вкладки Прочее
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Валенки'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Сланцы'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	И я перехожу к закладке с именем "Прочее"
	И в поле с именем 'ОбоснованиеОтгрузки' я ввожу текст 'Тестовый документ'
* Проверка копирования и удаления трок ТЧ
	И в таблице "Товары" я перехожу к строке:
		| 'N' | 'Количество' | 'Сумма'    | 'Товар'   | 'Цена'     |
		| '1' | '1,00'       | '2 000,00' | 'Валенки' | '2 000,00' |
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюСкопировать' на элементе формы с именем "Товары"
	И в таблице "Товары" я завершаю редактирование строки
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюУдалить' на элементе формы с именем "Товары"
* Проверка ТЧ и итоговых значений
	И таблица "Товары" стала равной:
		| 'N' | 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'    |
		| '1' | 'Валенки' | '2 000,00' | '1,00'       | '2 000,00' |
		| '2' | 'Сланцы'  | '450,00'   | '2,00'       | '900,00'   |		
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '3'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '2 900'
	
* Проверка записи и проведения документа		
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "Номер"
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Продажа * от * *' в течение 20 секунд		
* Открываем созданный документ для проверкидвижений	
	И в таблице "Список" я перехожу к строке
		| 'Номер' |
		| '$Номер$' |
	И в таблице "Список" я выбираю текущую строку
* Проверка движений - Регистр взаиморасчетов с контрагентами
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" содержит строки по шаблону:
		| 'Период' | 'Регистратор' | 'Номер строки' | 'Контрагент'   | 'Сумма'    | 'Валюта' |
		| '*'      | 'Продажа *'   | '1'            | 'Шлюзовая ООО' | '2 900,00' | 'Рубли'  |
* Проверка движений - Регистр Регистр продаж
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" содержит строки по шаблону:
		| 'Период' | 'Регистратор' | 'Номер строки' | 'Покупатель'   | 'Товар'   | 'Количество' | 'Сумма'    |
		| '*'      | 'Продажа *'   | '1'            | 'Шлюзовая ООО' | 'Валенки' | '1,00'       | '2 000,00' |
		| '*'      | 'Продажа *'   | '2'            | 'Шлюзовая ООО' | 'Сланцы'  | '2,00'       | '900,00'   |
* Проверка движений - Регистр Регистр товарных запасов
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" содержит строки по шаблону:
		| 'Период' | 'Регистратор' | 'Номер строки' | 'Товар'   | 'Склад'   | 'Количество' |
		| '*'      | 'Продажа *'   | '1'            | 'Валенки' | 'Большой' | '1,00'       |
		| '*'      | 'Продажа *'   | '2'            | 'Сланцы'  | 'Большой' | '2,00'       |
* Проверка печатных форм
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
* Печать Расходной накладной
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	И табличный документ "SpreadsheetDocument" содержит строки из макета "МакетПроверкиПФРасходТовара" по шаблону
	И я закрываю текущее окно
* Печать Оформить доставку	
	И я нажимаю на кнопку с именем 'ФормаОформитьДоставку'
	И табличный документ "ТабличныйДокумент" содержит строки из макета "МакетПроверкиПФДоставка" по шаблону
	И я закрываю текущее окно
			
* Контроль остатков при проведении
	И в таблице "Товары" я перехожу к строке
		| 'Товар'  |
		| 'Сланцы' |
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'OK'
	И в логе сообщений TestClient есть строки по шаблону:
		| 'Не хватает * единиц товара"Сланцы" на складе"Большой".Максимальное количество: *.' |
	И я закрываю текущее окно
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

* Проверка отмены проведения и пометки удаления документа
	И в таблице "Список" я перехожу к строке
		| 'Номер' |
		| '$Номер$' |
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем "Список"
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button0'
