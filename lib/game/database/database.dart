import 'package:human_simulator/game/conditions/effect.dart';
import 'package:human_simulator/game/database/models/game_value.dart';

import 'models/cars.dart';
import 'models/cloth.dart';
import 'models/education.dart';
import 'models/family.dart';
import 'models/food.dart';
import 'models/house.dart';
import 'models/job.dart';

const int moodIndex = 1;
const int moneyIndex = 2;
const int incomeIndex = 3;

const int carIndex = 4;
const int clothIndex = 5;
const int educationIndex = 6;
const int familyIndex = 7;
const int foodIndex = 8;
const int houseIndex = 9;
const int jobIndex = 10;

List<GameValue> all() => [
      ...cars(),
      ...clothes(),
      ...educations(),
      ...families(),
      ...foods(),
      ...houses(),
      ...jobs(),
    ];

GameValue findValueById(int id) => all().firstWhere((element) => element.id == id);

List<GameValue> getCollectionByType(Type type) {
  switch (type) {
    case Car:
      return cars();
    case Cloth:
      return clothes();
    case Education:
      return educations();
    case Family:
      return families();
    case Food:
      return foods();
    case House:
      return houses();
    case Job:
      return jobs();
    default:
      return cars();
  }
}

List<Car> cars() {
  List<Car> cars = [];
  var startIndex = carIndex * 1000;
  cars.add(Car(startIndex + 1, title: "Нет", price: 0, outcome: 0));
  cars.add(Car(startIndex + 2, title: "Машина с авторазбора", price: 1400, outcome: 40));
  cars.add(Car(startIndex + 3, title: "Старая машина", price: 2500, outcome: 110));
  cars.add(Car(startIndex + 4, title: "Гибридный автомобиль", price: 5000, outcome: 0));
  cars.add(Car(startIndex + 5, title: "Тачка из 90х", price: 5000, outcome: 250));
  cars.add(Car(startIndex + 6, title: "Подержанная машина", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 7, title: "Новый седан", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 8, title: "Пикап", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 9, title: "SUV", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 10, title: "SUV LUXURY", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 11, title: "Спорткар", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 12, title: "Суперкар", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 13, title: "Гиперкар", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 14, title: "Гиперкар LUXURY", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 15, title: "Сверхлегкий частный самолет", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 16, title: "Бизнес джет", price: 10000, outcome: 375));
  cars.add(Car(startIndex + 17, title: "Президентский лайнер", price: 10000, outcome: 375));
  return cars;
}

List<Cloth> clothes() {
  List<Cloth> clothes = [];
  var startIndex = clothIndex * 1000;
  clothes.add(Cloth(startIndex + 1, title: "Тряпки с помойки", price: 0, outcome: 0));
  clothes.add(Cloth(startIndex + 2, title: "Старая одежда", price: 0, outcome: 15));
  clothes.add(Cloth(startIndex + 3, title: "Дешевый секонд-хенд", price: 0, outcome: 65));
  clothes.add(Cloth(startIndex + 4, title: "Одежда из дискаунтера", price: 0, outcome: 125));
  clothes.add(Cloth(startIndex + 5, title: "Кежуал", price: 0, outcome: 250));
  clothes.add(Cloth(startIndex + 6, title: "Брендовая одежда", price: 0, outcome: 500));
  clothes.add(Cloth(startIndex + 7, title: "Смокинг", price: 0, outcome: 875));
  clothes.add(Cloth(startIndex + 8, title: "Костюм под заказ", price: 0, outcome: 2500));
  return clothes;
}

List<Education> educations() {
  List<Education> educations = [];
  var startIndex = educationIndex * 1000;
  educations.add(Education(startIndex + 1, title: "Нет", month: 0, outcome: 0));
  educations.add(Education(startIndex + 2, title: "Среднее образование", month: 36, outcome: 350));
  educations.add(Education(startIndex + 3, title: "Высшее образование", month: 18, outcome: 1000));
  educations.add(Education(startIndex + 4, title: "Водительские курсы", month: 6, outcome: 105));
  educations.add(Education(startIndex + 5, title: "Кулинарная школа", month: 2, outcome: 1800));
  educations.add(Education(startIndex + 6, title: "Курсы менеджера продаж", month: 6, outcome: 880));
  educations.add(Education(startIndex + 7, title: "Курсы управления персоналом", month: 12, outcome: 250));
  educations.add(Education(startIndex + 8, title: "Курсы строительства", month: 2, outcome: 1500));
  educations.add(Education(startIndex + 9, title: "Курсы инженерного искусства", month: 36, outcome: 1000));
  educations.add(Education(startIndex + 10, title: "Институт экономики и финансов", month: 6, outcome: 1200));
  educations.add(Education(startIndex + 11, title: "Бизнес тренинг", month: 2, outcome: 2800));
  educations.add(Education(startIndex + 12, title: "Бизнес школа", month: 9, outcome: 4500));
  educations.add(Education(startIndex + 13, title: "Курсы юриспруденции", month: 2, outcome: 7500));
  educations.add(Education(startIndex + 14, title: "Аспирантура", month: 36, outcome: 1750));
  educations.add(Education(startIndex + 15, title: "Защита докторской по философии", month: 60, outcome: 2500));
  return educations;
}

List<Family> families() {
  List<Family> families = [];
  var startIndex = familyIndex * 1000;
  families.add(Family(startIndex + 1, title: "Нет", price: 0, outcome: 0));
  families.add(Family(startIndex + 2, title: "Собака", price: 125, outcome: 125));
  families.add(Family(startIndex + 3, title: "Девушка", price: 200, outcome: 650));
  families.add(Family(startIndex + 4, title: "Невеста", price: 400, outcome: 1000));
  families.add(Family(startIndex + 5, title: "Жена", price: 0, outcome: 1500));
  families.add(Family(startIndex + 6, title: "Жена и ребенок", price: 0, outcome: 2700));
  families.add(Family(startIndex + 7, title: "Жена и двое детей", price: 0, outcome: 3900));
  return families;
}

List<Food> foods() {
  List<Food> foods = [];
  var startIndex = foodIndex * 1000;
  foods.add(Food(startIndex + 1, title: "Еда с помойки", price: 0, outcome: 0));
  foods.add(Food(startIndex + 2, title: "Хотдоги", price: 0, outcome: 50));
  foods.add(Food(startIndex + 3, title: "Дешевые бургеры", price: 0, outcome: 300));
  foods.add(Food(startIndex + 4, title: "Полуфабрикаты", price: 0, outcome: 650));
  foods.add(Food(startIndex + 5, title: "Дешевое кафе", price: 0, outcome: 950));
  foods.add(Food(startIndex + 6, title: "Домашняя еда", price: 0, outcome: 1250));
  foods.add(Food(startIndex + 7, title: "Бизнес-ланчи", price: 0, outcome: 2500));
  foods.add(Food(startIndex + 8, title: "Ресторан", price: 0, outcome: 3750));
  foods.add(Food(startIndex + 9, title: "Ресторан Мишлен", price: 0, outcome: 6300));
  foods.add(Food(startIndex + 10, title: "Личный повар", price: 0, outcome: 12500));
  foods.add(Food(startIndex + 11, title: "Фуршеты с бизнесменами", price: 0, outcome: 25000));
  foods.add(Food(startIndex + 12, title: "Ланчи с политиками", price: 0, outcome: 37500));
  return foods;
}

List<House> houses() {
  List<House> houses = [];
  var startIndex = houseIndex * 1000;
  houses.add(House(startIndex + 1, title: "Теплотрасса", price: 0, outcome: 0));
  houses.add(House(startIndex + 2, title: "Общежитие", price: 0, outcome: 50));
  houses.add(House(startIndex + 3, title: "Коммуналка", price: 0, outcome: 120));
  houses.add(House(startIndex + 4, title: "1к квартира", price: 0, outcome: 170));
  houses.add(House(startIndex + 5, title: "Квартира-студия", price: 0, outcome: 250));
  houses.add(House(startIndex + 6, title: "Апартаменты", price: 0, outcome: 820));
  houses.add(House(startIndex + 7, title: "Апартаменты в центре города", price: 0, outcome: 1200));
  houses.add(House(startIndex + 8, title: "Пентхаус", price: 0, outcome: 1800));
  houses.add(House(startIndex + 9, title: "Большой дом в центре города", price: 0, outcome: 2000));
  houses.add(House(startIndex + 10, title: "Шале", price: 0, outcome: 4300));
  houses.add(House(startIndex + 11, title: "Усадьба", price: 0, outcome: 7000));
  houses.add(House(startIndex + 12, title: "Видовая усадьба", price: 0, outcome: 8400));
  houses.add(House(startIndex + 13, title: "Собственный отель", price: 0, outcome: 9500));
  houses.add(House(startIndex + 14, title: "Замок", price: 0, outcome: 12500));
  houses.add(House(startIndex + 15, title: "Частный остров", price: 0, outcome: 25000));
  return houses;
}

List<Job> jobs() {
  List<Job> jobs = [];
  var startIndex = jobIndex * 1000;
  jobs.add(
    Job(
      startIndex + 1,
      title: "Безработный бомж",
      income: 0,
    )..lifeEffect = BadEffect(life: 10),
  );
  jobs.add(
    Job(
      startIndex + 2,
      title: "Аниматор",
      income: 125,
      requirenments: [clothIndex * 1000 + 2, foodIndex * 1000 + 2, houseIndex * 1000 + 2],
    )..lifeEffect = GoodEffect(life: 9),
  );
  jobs.add(Job(startIndex + 2, title: "Доставщик пиццы", income: 150));
  jobs.add(Job(startIndex + 3, title: "Сборщик бургеров", income: 215));
  jobs.add(Job(startIndex + 4, title: "Продавец мобильных телефонов", income: 250));
  jobs.add(Job(startIndex + 5, title: "Таксист", income: 625));
  jobs.add(Job(startIndex + 6, title: "Кассир в АТБ", income: 190));
  jobs.add(Job(startIndex + 7, title: "Младший инженер", income: 750));
  jobs.add(Job(startIndex + 8, title: "Старший инженер", income: 1000));
  jobs.add(Job(startIndex + 9, title: "Руководитель отдела", income: 1500));
  jobs.add(Job(startIndex + 10, title: "Директор отделения", income: 2000));
  jobs.add(Job(startIndex + 11, title: "Региональный менеджер", income: 2500));

  return jobs;
}
