enum Strings {
    enum SearchModal {
        static let searchPlaceholder = "Найти остановку или маршрут"
        enum FavoritesGroup {
            static let title = "Избранное"
            enum Transport {
                static let title = "Траснпорт"
                static let favorite = "Избранный транспорт"
                static let emptyDescription = "Добавьте избранный транспорт на карте"
            }
            enum Stops {
                static let title = "Остановки"
                static let favorite = "Избранные остановки"
                static let emptyDescription = "Добавьте избранные остановки на карте"
            }
            enum Routes {
                static let title = "Маршруты"
                static let favorite = "Избранные маршруты"
                static let emptyDescription = "Добавьте избранные маршруты на карте"
            }
        }
        enum RoutesGroup {
            static let title = "Маршруты"
            static let description = "Список маршрутов общественного транспорта разделен на три категории: регулируемый тариф, маршруты МУП \"КТТУ\" и остальные. На данный момент доступно 126 маршрутов."
            enum DescriptionKeyWords {
                static let regulatedRates = "регулируемый тариф"
                static let KTTU_MunicipalEnterprise = "маршруты МУП \"КТТУ\""
                static let others = "остальные"
            }
        }
        
    }
    enum Settings {
        static let title = "Настройки"
        static let description = "Все настройки, которые вы изменяете, остаются на вашем устройстве. Эти данные не передаются ни на какие серверы и не выходят в интернет."
        enum AppearanceSection {
            static let title = "Внешний вид"
            static let darkMode = "Тёмный режим"
            static let darkModeDescription = "Отображать приложение в тёмных тонах"
            static let iconsSize = "Размер иконок"
        }
        enum DataSection {
            static let title = "Данные"
            static let dataSaving = "Экономия данных"
            static let dataSavingDescription = "Увеличить время обновления информации на сайте. Будьте осторожны, это может повлечь за собой отображение устаревшей информации"
            
        }
        enum ResetAndDevelopmentSection {
            static let title = "Сброс и разработка"
            static let developmentMode = "Режим разработки"
            static let developmentModeDescription = "Предоставляет информацию для разработки и тестирования. Не рекомендуем включать без необходимости"
            static let resetSettings = "Сбросить настройки"
            static let resetFavorites = "Сбросить избранное"
        }
    }
    enum ReportIssue {
        static let title = "Сообщить об ошибке"
    }
    enum InfoBar {
        static let address = "Россия, г. Краснодар"
        static let organization = "KRDPT"
        enum Menu {
            static let termsOfService = "Условия сервиса"
            static let authors = "Авторы"
            static let telegram = "Telegram"
        }
    }
}
