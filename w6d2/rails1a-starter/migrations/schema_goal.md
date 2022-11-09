# Schema Goal

## `users`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | bigint    | not null, primary key          |
| `username`         | string    | not null, indexed, unique      |
| `password`         | string    | not null                       |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `restaurants`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | bigint    | not null, primary key          |
| `name`             | string    | not null                       |
| `address`          | string    | not null                       |
| `owner_id`         | bigint    | not null, indexed, foreign key |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `reviews`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | bigint    | not null, primary key          |
| `body`             | text      | not null                       |
| `rating`           | integer   | not null                       |
| `user_id`          | bigint    | not null, indexed, foreign key |
| `restaurant_id`    | bigint    | not null, indexed, foreign key |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |