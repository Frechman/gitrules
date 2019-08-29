#Использовать cli
#Использовать "."
#Использовать "../core"

// Обработчик выполнения команды
//
// Параметры:
//   КомандаПриложения - КомандаПриложения - Выполняемая команда
//
Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт

	КомандаПриложения.ВывестиСправку();

КонецПроцедуры


///////////////////////////////////////////////////////////////////////////////

Процедура ВыполнитьПриложение()

	ИмяПродукта = ПараметрыПриложения.ИмяПродукта();

    Приложение = Новый КонсольноеПриложение(ИмяПродукта, "Версионирование правил обмена 1С с помощью git");
    Приложение.Версия("v version", ПараметрыПриложения.ВерсияПродукта());

    Приложение.ДобавитьКоманду(
        "i install", 
        СтрШаблон("Установить %1 в текущий репозиторий", ИмяПродукта), 
        Новый КомандаInstall);

    Приложение.ДобавитьКоманду(
        "r remove", 
        СтрШаблон("Удалить %1 в текущем репозитории", ИмяПродукта), 
        Новый КомандаRemove);

	Приложение.ДобавитьКоманду(
        "e export", 
        "Распаковка правил обмена xml на файлы и каталоги", 
        Новый КомандаExport);

    Приложение.ДобавитьКоманду(
        "a assembly", 
        "Сборка из каталогов и файлов правил xml", 
        Новый КомандаAssembly);

    Приложение.ДобавитьКоманду(
        "p precommit", 
        "Разборка правил обмена xml без git commit",
        Новый КомандаPrecommit);

	Приложение.УстановитьОсновноеДействие(ЭтотОбъект);

    Приложение.Запустить(АргументыКоманднойСтроки);

КонецПроцедуры // ВыполнениеКоманды()

///////////////////////////////////////////////////////

Попытка

    ВыполнитьПриложение();

Исключение

    Сообщить(ОписаниеОшибки());

КонецПопытки;