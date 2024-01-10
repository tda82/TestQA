﻿#language: ru

@tree

Функционал: <описание фичи>

Как тестировщик я хочу
проверить использование условий при заполнении реквизитов в тестах 
чтобы уметь пользоватся этим механизмом   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 подготовительный сценарий (заказ покупателя)
	Когда экспорт основных данных

Сценарий: _0502 заполнение соглашения в шапке документа
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Код' |
		| '2'   |
	И в таблице "List" я выбираю текущую строку
	Если элемент формы с именем "Agreement" имеет значение "" тогда
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		И в таблице "List" я перехожу к строке:
			| 'Код' |
			| '3'   |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'