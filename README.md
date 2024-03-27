Мета проекту - тренування підняття проекту з використанням Laravel, docker, php, node.
Додано автоматичне відправка в ваш локальний Registery черз Git Runner.

Скачуємо проект, обов'язково з флагом --recurse-submodules для скачування доданного сабмодуля.
git clone --recurse-submodules https://github.com/Bogi25/gitLocal-DH.git

Додайте Git Runner в GitHub Settings > Actions > Runners >new self-hosted runnerз а стандартною інструкцією та запустіть.


В проекті збирається два докер зліпки тому на локальному Registery треба підготувати два репозиторію
<DOCKER_USERNAME_LOCAL>/laravel-dock-php-one
<DOCKER_USERNAME_LOCAL>/laravel-dock-node-t
Це реалізовано за допомогою проекту https://github.com/Bogi25/registryme.

Скрипт потребує прав адміністратора. Створює усі необхідні папки. Додає запис 127.0.0.1 registry.local в /etc/hosts. Записує та шифрує логін та пароль, за допомогою htpasswd, секретів DOCKER_USERNAME_LOCAL та DOCKER_PASSWORD_LOCAL які були додані в GitHub. Створює два самопідписані сертифікати. Та додає їх до Docker щоб той їм довіряв.

У скрипті інтерактивно треба буде ввести три параметри: логін - який є вашим DOCKER_USERNAME_LOCAL доданим до секрету в GitHub. -пароль який є вашим паролем доданним в секрет DOCKER_PASSWORD_LOCAL в GitHub. -ім'я вашого користувача для визначення робочої папки користувача під яким ви використовуєте docker.

Для його запуску виконайте ./gitLocal-DH/registryme/start-setting.sh
або просто ./start-setting.sh в папці registryme

Заходимо в папку з проектом cd gitLocal-DH
Запускаємо docker compose up

Для відпривки в локальний Registery використано секрети DOCKER_USERNAME_LOCAL та DOCKER_PASSWORD_LOCAL які були додані в GitHub.
Опис знаходиться в файлі .github/workflows/push-local-dh.yml
Докер зліпки відправляються на адресу:
registry.local:5000    (laravel-dock-php-one)
registry.local:5100    (laravel-dock-node-t)

При виконанні команди git push до репозиторію автоматично буде відправка в локальний Registery. Збірку буде виконувати Git Runner.
