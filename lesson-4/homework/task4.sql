    create table letters
    (letter char(1));

    insert into letters
    values ('a'), ('a'), ('a'), 
    ('b'), ('c'), ('d'), ('e'), ('f');

select letter 
from letters
order by 
case 
    when letter = 'b' then 0
    else 1
end, letter;

select letter
from letters
order by 
  case 
    when letter = 'b' THEN 1 
    else 0 
  end,
letter;

select letter 
from (select letter from letters where letter <> 'b' order by letter
offset 0 row fetch next 2 rows only) as sorted_letters
union all
select 'b'
union all
select letter from (select letter from letters where letter <> 'b' order by letter
offset 2 rows) as sorted_letters
