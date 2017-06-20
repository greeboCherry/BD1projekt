# BD1projekt
Projekt miał być bazą członków i projektów w TK Games, ale ostatecznie jest bazą wypełnioną losowymi danymi, tematyka mniej więcej ta sama.

## Tworzenie i usuwanie
W folderze sql_scripts znajdują się skrypty(do odpalenia przez sql developera, po połączeniu się z jakąś bazą) tworzące bazę i wypełniające ją losowymi danymi(CreateTable.sql) oraz dodający trigger(trigger.sql)
Tworzenie triggera jest w osobnym pliku bo Developer się pluł o jakieś błędy
Ponadto w tym samym folderze przykładowe zapytania(scripts) i skrypt do sprzątania(dropTables.sql)

## Aplikacja
Aplikacja nie pozwala zrobić wszytkiego, spełnia jedynie minmalne wymagania. Tzn dodamy nowego członka do koła ale nie stworzymy nowego projektu.
Nie jest idiotoodporna, tzn. nie była testowana "co się stanie jeśli wcisnę losowy klawisz w tym podmenu".

## Dokumentacja
Diagram bazy danych jest w pliku scehmat225937.jpg, razem z komentarzami.
Srypty są okomentowane, tzn nad każdym jest napisane co on robi.
Kod ma czytelne nazwy zmiennych i funkcji.
