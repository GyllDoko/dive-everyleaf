# README

### Model User

| Colums   | Description |
| -------- | ----------- |
| name     | string      |
| email    | string      |
| password | string      |
| is_admin | boolean     |

### Model Task

| Colums      | Description |
| ----------- | ----------- |
| name        | string      |
| content     | string      |
| expiry_date | string      |
| status      | boolean     |
| priority    | string      |
| user_id     | foreign_key |

### Ticket

| Colums | Description |
| ------ | ----------- |
| name   | string      |

### task_ticket_relation

| Colums    | Description |
| --------- | ----------- |
| task_id   | foreign_key |
| ticket_id | foreign_key |
