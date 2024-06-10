# 15 HTTP, URL, JSON, API
## HTTP
HyperText Transfer Protocol представляет собой набор правил, которые логически определяют, как компьютеры могут отправлять/получать гипертекстовые документы и используется в двух основных случаях:
+ HTTP-сообщение отправляется открытым текстом, передаваемая информация может быть легко перехвачена и расшифрована.
+ По умолчанию HTTP-запросы отправляются на порт 80.
## HTTPS
HyperText Transfer Protocol Secure - расширение HTTP, использующее шифрование для повышения уровня безопасности передачи данных:
+ Сообщения HTTPS шифруются.
+ Шифрование требует времени и вычислительных ресурсов, поэтому HTTPS обычно работает медленнее, чем HTTP.
+ HTTPS-запросы по умолчанию отправляются на порт 443.

HTTP (и HTTPS) являются протоколами без состояния (stateless protocol). Это значит, что каждый раз, когда вы отправляете запрос на сервер, этот запрос не содержит информации о предыдущих запросах. С точки зрения сервера, каждый новый запрос как будто поступает от совершенно нового клиента. Например, если вы переходите с одной страницы на другую на одном сайте, сервер не помнит, что вы только что были на предыдущей странице. В "приложении с состоянием" (stateful application) важно, чтобы сервер помнил предшествующие взаимодействия с клиентом. Например, при авторизации на сайте сервер должен помнить, что вы вошли в систему, чтобы не требовать повторного ввода логина и пароля при переходе на другую страницу сайта. Чтобы обеспечить и согласованность запросов, используются разные методы:
+ Cookies (куки): Маленькие файлы, которые сервер отправляет браузеру клиента, и которые затем отправляются обратно серверу с каждым последующим запросом. Таким образом, сервер может "узнавать" клиента и отслеживать его действия.
+ Сессии (sessions): Сервер может создавать уникальные идентификаторы сессий для каждого пользователя, которые сохраняются в куки или в URL. Эти идентификаторы позволяют серверу связывать текущий запрос с предыдущими запросами от того же клиента.
+ Заголовки HTTP (HTTP headers): В HTTP-заголовках могут передаваться дополнительные данные, которые помогают серверу идентифицировать и отслеживать клиента. Например, заголовок Authorization может содержать токен, который сервер использует для проверки прав доступа клиента.

Для шифрования информации, передаваемой по протоколу HTTPS, на сервере должен быть установлен так называемый сертификат SSL (Secure Sockets Layer) или TLS (Transport Layer Security, улучшенная версия SSL). Сертификат SSL/TLS состоит из двух частей: открытого ключа, используемого для шифрования данных, и закрытого ключа, используемого для их расшифровки и видимого только для вашего сайта. Практически, ключи представляют собой пару уникальных текстовых файлов, созданных вместе и выглядящих для пользователя как набор непонятных символов. Чтобы сгенерировать такую пару, необходимо отправить запрос на подписание сертификата (CSR) в специальную организацию - центр сертификации (CA), сообщив ему о назначении вашего сайта, названии организации и т. д. Запрос имеет специальный формат и может быть автоматически сгенерирован специальными программами.

URI = URL + URN
URL = protocol://host:port/path?parameters

Методы HTTP
	GET POST PUT DELETE PATCH HEAD OPTIONS CONNECT TRACE

Коды состояния HTTP

	200 OK (хорошо)
	201 Created Код (ресурс создан)
	301 Moved Permanently (перемещено навсегда)
	302 Moved Temporarily (перемещено временно)
	304 Not Modified (не изменялось, для заголовка запроса "If-Modified-Since")
	400 Bad Request (недопустимый запрос)
	401 Unauthorized (недостаточно прав)
	403 Forbidden (запрещено)
	404 Not found (не найдено)
	500 Internal Server Error (внутренняя ошибка сервера)
	502 Bad Gateway (недопустимый шлюз)
	503 Service Unavailable (служба недоступна)
	504 Gateway Timeout (истекло время ожидания шлюза)
	
Архитектурный стиль REST

REST — это стиль архитектуры программного обеспечения, определяющий набор правил, ограничений, рекомендаций для разработки веб-приложений (в основном веб-служб и API). В основе REST лежит HTTP: он определяет способы, с помощью которых клиент создаёт ресурсы на стороне сервера и получает доступ к ним.	

Примеры для GET:
	Получение информации о ресурсе - GET /api/users/123
	Получение списка ресурсов - GET /api/products
	Фильтрация результатов - GET /api/products?category=electronics
	Пагинация результатов - GET /api/posts?page=2&pageSize=10
	Получение подробностей о ресурсе - GET /api/articles/456/details
	Получение ресурса с использованием путей - GET /api/countries/usa/cities/new-york
	Получение коллекции связанных ресурсов - GET /api/articles/123/comments

Программный интерфейс API - набор правил взаимодействия с конкретным приложением. 

Веб-ориентированные API:
	- SOAP 
	- REST
	- GraphQL

Документация для API
	классическая (таблицы и тексты)
	динамическая (Swagger, OpenAPI)
