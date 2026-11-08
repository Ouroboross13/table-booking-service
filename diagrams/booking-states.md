# Жизненный цикл бронирования

```mermaid
stateDiagram-v2
    [*] --> PENDING: Создание заявки
    PENDING --> CONFIRMED: Автоподтверждение
    CONFIRMED --> SEATED: Гость пришел (отметка хостес)
    CONFIRMED --> CANCELLED: Отмена клиентом
    CONFIRMED --> NO_SHOW: Гость не пришел (> 30 мин)
    SEATED --> COMPLETED: Гость ушел
    CANCELLED --> [*]
    NO_SHOW --> [*]
    COMPLETED --> [*]
```