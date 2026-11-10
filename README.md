# Проектирование и администрирование БД «Учет клиентов и услуг барбершопа"

## 🗂 Структура базы данных

### 1. Справочники и персонал
* **`Positions` (Должности)**
  * `position_id` (PK) — INT, автоинкремент.
  * `position_name` — VARCHAR(100), название должности (например, «Топ-барбер»).
* **`Employees` (Мастера / Сотрудники)**
  * `employee_id` (PK) — INT, автоинкремент.
  * `first_name` — VARCHAR(50), имя.
  * `last_name` — VARCHAR(50), фамилия.
  * `phone` — VARCHAR(20), телефон.
  * `position_id` (FK) — INT, ссылка на `Positions`.

### 2. Клиенты и Услуги
* **`Clients` (Клиенты)**
  * `client_id` (PK) — INT, автоинкремент.
  * `first_name` — VARCHAR(50), имя.
  * `last_name` — VARCHAR(50), фамилия.
  * `phone` — VARCHAR(20), уникальный номер телефона.
  * `email` — VARCHAR(100), электронная почта.
* **`Services` (Услуги)**
  * `service_id` (PK) — INT, автоинкремент.
  * `service_name` — VARCHAR(150), название услуги.
  * `price` — DECIMAL(10, 2), базовая стоимость.
  * `duration_min` — INT, длительность в минутах.

### 3. Процесс записи и Оплата
* **`Appointments` (Записи / Визиты)**
  * `appointment_id` (PK) — INT, автоинкремент.
  * `client_id` (FK) — INT, ссылка на `Clients`.
  * `employee_id` (FK) — INT, ссылка на `Employees`.
  * `appointment_datetime` — DATETIME, дата и время начала визита.
  * `payment_status` — VARCHAR(20), статус (например, «Оплачено», «Ожидается»).
  * `payment_method` — VARCHAR(30), способ (например, «Карта», «Наличные»).
* **`Appointment_Details` (Детали записи)** — *Связь «многие-ко-многим»*
  * `appointment_id` (PK, FK) — INT, ссылка на `Appointments`.
  * `service_id` (PK, FK) — INT, ссылка на `Services`.
  * `quantity` — INT, количество (по умолчанию 1).
  * `actual_price` — DECIMAL(10, 2), цена на момент оказания услуги (фиксирует стоимость при изменении прайса или скидках).
