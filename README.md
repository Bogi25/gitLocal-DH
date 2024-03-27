Мета проекту - тренування підняття проекту з використанням Laravel, docker, php, node.
Додано автоматичне відправка в ваш локальний Registery черз Git Runner.

Скачуємо проект, обов'язково з флагом --recurse-submodules для скачування доданного сабмодуля.
git clone --recurse-submodules https://github.com/Bogi25/gitLocal-DH.git

Встановлюємо Git Runner за стандартною інструкцією і запускаємо.

Заходимо в папку з проектом cd gitLocal-DH
Запускаємо docker compose up

В проекті збирається два докер зліпки тому на локальному Registery треба підготувати два репозиторію
<DOCKER_USERNAME_LOCAL>/laravel-dock-php-one
<DOCKER_USERNAME_LOCAL>/laravel-dock-node-t
Це реалізовано за допомогою проекту https://github.com/Bogi25/registryme.


Для відпривки в локальний Registery використано секрети DOCKER_USERNAME_LOCAL та DOCKER_PASSWORD_LOCAL які були додані в GitHub.
Опис знаходиться в файлі .github/workflows/push-local-dh.yml
Докер зліпки відправляються на адресу:
registry.local:5000    (laravel-dock-php-one)
registry.local:5100    (laravel-dock-node-t)

При виконанні команди git push до репозиторію автоматично буде відправка в локальний Registery. Збірку буде виконувати Git Runner.
