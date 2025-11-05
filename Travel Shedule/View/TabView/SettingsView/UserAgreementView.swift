import SwiftUI

struct UserAgreementView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Text("""
            Оферта на оказание образовательных услуг дополнительного образования Яндекс.Практикум  для физических лиц
            """)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlack)
                .padding(.bottom, 10)
                Text("""
            Данный документ является действующим, если расположен по адресу: https://yandex.ru/legal/practicum_offer
                 
            Российская Федерация, город Москва
            """)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlack)
                .padding(.bottom, 10)
                Text("1. Термины")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlack)
                Text("""
            Понятия, используемые в Оферте, означают следующее:  Авторизованные адреса — адреса электронной почты каждой Стороны. Авторизованным адресом Исполнителя является адрес электронной почты, указанный в разделе 11 Оферты. Авторизованным адресом Студента является адрес электронной почты, указанный Студентом в Личном кабинете.  Вводный курс — начальный Курс обучения по представленным на Сервисе Программам обучения в рамках выбранной Студентом Профессии или Курсу, рассчитанный на определенное количество часов самостоятельного обучения, который предоставляется Студенту единожды при регистрации на Сервисе на безвозмездной основе. В процессе обучения в рамках Вводного курса Студенту предоставляется возможность ознакомления с работой Сервиса и определения возможности Студента продолжить обучение в рамках Полного курса по выбранной Студентом Программе обучения. Точное количество часов обучения в рамках Вводного курса зависит от выбранной Студентом Профессии или Курса и определяется в Программе обучения, размещенной на Сервисе. Максимальный срок освоения Вводного курса составляет 1 (один) год с даты начала обучения.
            """)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlack)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("Пользовательское соглашение")
        .navigationBarTitleDisplayMode(.inline)
        .background(.ypWhite)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.ypBlack)
                .font(.system(size: 18, weight: .medium))
                .padding(8)
        }
    }
}

#Preview {
    UserAgreementView()
}
