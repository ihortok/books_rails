SELECT
	title AS book_title,
	name AS author_name,
	email AS user_email
FROM
    books b
INNER JOIN authors a ON b.author_id = a.id
INNER JOIN users u ON b.user_id = u.id
