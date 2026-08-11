<p align="center">
  <img src="assets/talonbot.png" alt="TalonBot" width="120">
</p>

<h1 align="center">🏥 TalonBot</h1>

<p align="center">
  <strong>Автозапись к врачу на napriem.info</strong><br>
  Desktop · Windows · Брянск и область · коммерческий pet-project
</p>

<p align="center">
  <img src="https://img.shields.io/badge/🖥️_platform-Windows_10%2F11-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows">
  <img src="https://img.shields.io/badge/🐍_Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python">
  <img src="https://img.shields.io/badge/🎨_GUI-CustomTkinter-2d8659?style=for-the-badge" alt="CustomTkinter">
  <img src="https://img.shields.io/badge/📍_region-Брянск_и_область-43A047?style=for-the-badge" alt="Region">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/🤖_type-Desktop_Automation-512DA8?style=for-the-badge" alt="Automation">
  <img src="https://img.shields.io/badge/🏥_portal-napriem.info-1565C0?style=for-the-badge" alt="napriem.info">
  <img src="https://img.shields.io/badge/🔐_license-Proprietary-E53935?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/💰_status-Commercial-FF8F00?style=for-the-badge" alt="Commercial">
</p>

---

## 🩺 О проекте

**TalonBot** — мой личный коммерческий проект: desktop-приложение для жителей **Брянска и Брянской области**, которое мониторит официальный портал [napriem.info](https://napriem.info) и **автоматически пытается записать на талон**, когда появляется свободное окно.

Идея родилась из реальной боли: редкие талоны к узким специалистам исчезают за секунды. Вместо ручного F5 — фоновый бот со звуковым уведомлением при успехе.

> 📌 Этот репозиторий — **публичная витрина** проекта. Исходный код приложения **не распространяется бесплатно** и не является open-source.

---

## ✨ Возможности

| | Функция | Описание |
|:-:|---------|----------|
| 🖥️ | **Графический лаунчер** | Три шага: вход → выбор врача → запуск. Без ручного редактирования конфигов |
| 🔁 | **Автомониторинг** | Периодическая проверка свободных талонов на выбранную специальность |
| ⚡ | **Автозапись** | Попытка записи сразу при появлении окна |
| 🔔 | **Уведомление** | Звук Windows + зелёный баннер «ТАЛОН УСПЕШНО ВЗЯТ» |
| 🏥 | **Кэш МО** | Более 45 медорганизаций региона в базе |
| 🔑 | **Лицензия на 1 ПК** | Персональный ключ после покупки |

---

## 🔄 Как это работает

```
┌─────────────┐     ┌──────────────┐     ┌─────────────────┐
│  🖥️ Лаунчер │ ──▶ │ 🔐 Вход      │ ──▶ │ 🏥 Выбор врача  │
│  (GUI)      │     │ napriem.info │     │ в интерфейсе    │
└─────────────┘     └──────────────┘     └────────┬────────┘
                                                  │
                                                  ▼
┌─────────────┐     ┌──────────────┐     ┌─────────────────┐
│ 🔔 Звук +   │ ◀── │ ✅ Запись    │ ◀── │ 🔁 Мониторинг   │
│ 🎉 баннер   │     │  на талон    │     │ талонов (15 с)  │
└─────────────┘     └──────────────┘     └─────────────────┘
```

Подробнее — в [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) *(без раскрытия проприетарной логики)*.

---

## 📸 Скриншоты

<p align="center">
  <img src="docs/screenshots/1.jpg" alt="Вкладка «Вход» — авторизация на napriem.info" width="48%">
  &nbsp;
  <img src="docs/screenshots/2.jpg" alt="Вкладка «Запись» — выбор больницы и врача" width="48%">
</p>

<p align="center">
  <sub><b>1. Вход</b> — логин и проверка авторизации &nbsp;·&nbsp; <b>2. Запись</b> — больница, отделение, специальность, врач</sub>
</p>

<p align="center">
  <img src="docs/screenshots/3.jpg" alt="Вкладка «Запуск» — настройки и управление ботом" width="48%">
  &nbsp;
  <img src="docs/screenshots/4.jpg" alt="Успешная запись — талон взят" width="48%">
</p>

<p align="center">
  <sub><b>3. Запуск</b> — интервал опроса и логи &nbsp;·&nbsp; <b>4. Успех</b> — звук + баннер «ТАЛОН УСПЕШНО ВЗЯТ»</sub>
</p>

---

## 🛠 Стек технологий

<p align="center">
  <img src="https://img.shields.io/badge/UI-CustomTkinter-2d8659?style=flat-square" alt="UI">
  <img src="https://img.shields.io/badge/HTTP-requests-CC2927?style=flat-square&logo=curl&logoColor=white" alt="HTTP">
  <img src="https://img.shields.io/badge/API-napriem.info-1565C0?style=flat-square" alt="API">
  <img src="https://img.shields.io/badge/Auth-User_Session-7B1FA2?style=flat-square" alt="Auth">
  <img src="https://img.shields.io/badge/License-HW--bound_Keys-E65100?style=flat-square" alt="License system">
  <img src="https://img.shields.io/badge/Build-PowerShell-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="Build">
</p>

| Слой | Технологии |
|------|------------|
| 🎨 UI | Python, CustomTkinter |
| 🌐 HTTP / API | requests, интеграция с napriem.info |
| 🔐 Авторизация | Сессия пользователя на официальном портале |
| 🔑 Лицензирование | Привязка к hardware ID, персональные ключи |
| 📦 Сборка | PowerShell-архив для покупателей |

---

## 🛒 Купить

Программа распространяется **только после оплаты** — архив + персональный лицензионный ключ.

<p align="center">
  <a href="https://www.avito.ru/bryansk/predlozheniya_uslug/avtozapis_k_vrachu_napriem.info_talonbot_8134981995">
    <img src="https://img.shields.io/badge/🛒_Купить_на-Avito-00AAFF?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJ3aGl0ZSI+PHBhdGggZD0iTTEyIDJMMTMuMDkgOC4yNkwyMCA5bC01LjQ2IDQuNzRMMTYuMTggMjIgMTIgMTguNzcgNy44MiAyMiA5LjU0IDEzLjc0IDQgOWw2LjkxLTEuNzRMMTIgMnoiLz48L3N2Zz4=" alt="Avito">
  </a>
</p>

| Шаг | Действие |
|:---:|----------|
| 1️⃣ | Оплата на Avito |
| 2️⃣ | Распаковка архива и установка |
| 3️⃣ | Код компьютера → персональный ключ |
| 4️⃣ | Вход → Запись → Запуск бота |

---

## 🔒 Что **не** в этом репозитории

| 🚫 Не публикуется | Почему |
|-------------------|--------|
| Исходники бота и API-клиента | Коммерческий продукт |
| Генератор лицензий | Только у автора |
| Секреты и конфиги | Безопасность |
| Инструкции продавца | Внутренняя документация |

> ⚠️ Скачать репозиторий с GitHub **нельзя использовать как готовую программу** — здесь нет исполняемого кода.

---

## 👤 Автор

**Андрей Быченков** — автор и разработчик TalonBot.

- 🐙 GitHub: [@AndreyBychenkow](https://github.com/AndreyBychenkow)
- 💬 Покупка и вопросы — [Avito](https://www.avito.ru/bryansk/predlozheniya_uslug/avtozapis_k_vrachu_napriem.info_talonbot_8134981995)

---

## 📄 Лицензия

**Proprietary / All Rights Reserved.** См. [LICENSE](LICENSE).

🚫 Запрещено: копирование, модификация, распространение и коммерческое использование без письменного разрешения автора.

---

<p align="center">
  <img src="assets/talonbot.png" alt="" width="32">
  <br>
  <sub><b>TalonBot</b> · napriem.info · Брянская область · 2026</sub>
</p>
