require 'spec_helper'

describe Fias::Name::Extract do
  {
    'г Краснодар' => %w(Краснодар город г г.),
    'г. Краснодар' => %w(Краснодар город г г.),
    'Краснодар город' => %w(Краснодар город г г.),
    'Раменский район' => ['Раменский', 'район', 'р-н', 'р-н'],
    'Ямало-Ненецкий АО' => ['Ямало-Ненецкий', 'автономный округ', 'АО', 'АО'],
    'Еврейский автономный округ' => [
      'Еврейский', 'автономный округ', 'АО', 'АО'
    ],
    'Корягинский район' => ['Корягинский', 'район', 'р-н', 'р-н'],
    'гопотека Южное Бутово' => ['гопотека Южное Бутово'],
    'ул. Длинная' => %w(Длинная улица ул ул.),
    'ул. им. Злых Марсиан-3' => ['им. Злых Марсиан-3', 'улица', 'ул', 'ул.'],
    'Тверь г' => ['Тверь', 'город', 'г', 'г.'],
    'Тверь г.' => ['Тверь', 'город', 'г', 'г.'],
    'Гаврилова' => ['Гаврилова'],
    'пр Космонавтов' => ['Космонавтов', 'проспект', 'пр-кт', 'пр-кт'],
    'Искровский проспект' => ['Искровский', 'проспект', 'пр-кт', 'пр-кт'],
    'коттеджный поселок Морозов' => [
      'Морозов', 'коттеджный поселок', 'кп', 'кп'
    ],
    'поселок городского типа Свердловский' => [
      'Свердловский', 'поселок городского типа', 'пгт', 'пгт'
    ],
    'поселок Павловская Слобода' => [
      'Павловская Слобода', 'поселок', 'п', 'п.'
    ],
    'Павловская Слобода поселок' => [
      'Павловская Слобода', 'поселок', 'п', 'п.'
    ],
    'Иваново рабочий поселок' => ['Иваново', 'рабочий поселок', 'рп', 'рп'],
    'ул Славянский бульвар' => ['Славянский бульвар', 'улица', 'ул', 'ул.'],
    'ул Набережная' => ['Набережная', 'улица', 'ул', 'ул.'],
    'Сокольнический Вал ул.' => ['Сокольнический Вал', 'улица', 'ул', 'ул.'],
    'Сокольнический Вал улица' => ['Сокольнический Вал', 'улица', 'ул', 'ул.'],
    'ул Сокольнический Вал' => ['Сокольнический Вал', 'улица', 'ул', 'ул.'],
    'улица Сокольнический Вал' => ['Сокольнический Вал', 'улица', 'ул', 'ул.'],
    'М.Бронная ул.' => ['М.Бронная', 'улица', 'ул', 'ул.'],
    '1-я улица Машиностроения' => ['1-я Машиностроения', 'улица', 'ул', 'ул.'],
    'Аллея Ильича ул' => ['Аллея Ильича', 'улица', 'ул', 'ул.'],
    'ул.Сычева' => %w(Сычева улица ул ул.),
    'Мира улица.' => %w(Мира улица ул ул.),
    'Малаховка городского типа поселок' => [
      'Малаховка', 'поселок городского типа', 'пгт', 'пгт'
    ],
    'Калининград город' => ['Калининград', 'город', 'г', 'г.'],
    'коттеджный поселок Морозов' => [
      'Морозов', 'коттеджный поселок', 'кп', 'кп'
    ],
    'коттеджный Морозов' => ['Морозов', 'коттеджный поселок', 'кп', 'кп'],
    'Морозов коттеджный' => ['Морозов', 'коттеджный поселок', 'кп', 'кп'],
    'Морозов коттеджный поселок' => [
      'Морозов', 'коттеджный поселок', 'кп', 'кп'
    ],
    '' => nil,
    nil => nil
  }.each do |name, expected|
    it "must extract status from #{name} correctly" do
      given = described_class.extract(name)
      given = given.first(4) if given.is_a?(Array)
      expect(given).to eq(expected)
    end
  end
end
