grant select on clinica.medicos to 'victor@localhost';

grant select on clinica.especialidade to 'victor@localhost';

grant delete on clinica.especialidade to 'victor@localhost';

show grants for "victor@localhost";

grant select, insert, update, delete on clinica.* to 'victor@localhost';

revoke all on *.* to 'victor@localhost';

