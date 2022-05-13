defmodule Utils.Solutions do
  def startup_madlib do
    name_of_company = "a"
    a_defined_offering = "a"
    a_defined_audience = "a"
    solve_a_problem = "a"
    secret_sauce = "a"

    madlib =
      "My company, #{name_of_company} is developing #{a_defined_offering} to help #{a_defined_audience} #{solve_a_problem} with #{secret_sauce}."

    [
      madlib,
      name_of_company,
      a_defined_offering,
      a_defined_audience,
      solve_a_problem,
      secret_sauce
    ]
  end

  def nature_show_madlib do
    animal = "a"
    country = "a"
    plural_noun = "a"
    a_food = "a"
    type_of_screen_device = "a"
    noun = "a"
    verb1 = "a"
    verb2 = "a"
    adjective = "a"

    madlib =
      "The majestic #{animal} has roamed the forests of #{country} for thousands of years. Today she wanders in search of #{plural_noun}. She must find food to survive. While hunting for #{a_food}, she found a/an #{type_of_screen_device} hidden behind a #{noun}. She has never seen anything like this before. What will she do? With the device in her teeth, she tries to #{verb1}, but nothing happens. She takes it back to her family. When her family sees it, they quickly #{verb2}. Soon, the device becomes #{adjective}, and the family decides to put it back where they found it."

    [
      animal,
      country,
      plural_noun,
      a_food,
      type_of_screen_device,
      noun,
      verb1,
      verb2,
      adjective,
      madlib
    ]
  end


  def boolean_diagram1, do: false
  def boolean_diagram2, do: true
  def boolean_diagram3, do: false
  def boolean_diagram4, do: false
  def boolean_diagram5, do: true
  def boolean_diagram6, do: true

  def guess_the_word do
    guess = Enum.random(["answer", "incorrect answer"])
    answer = "answer"
    correct = (guess == answer && "Correct!") || "Incorrect."
    [guess, answer, correct]
  end

  def guess_the_number do
    guess = Enum.random(1..9)
    answer = Enum.random(1..9)

    correct =
      (guess == answer && "Correct!") || (guess < answer && "Too low!") ||
        (guess > answer && "Too high!")

    [guess, answer, correct]
  end

  def shopping_list do
    shopping_list = [] ++ ["grapes", "walnuts", "apples"]
    shopping_list = shopping_list ++ ["blueberries", "chocolate", "pizza"]
    shopping_list = shopping_list -- ["grapes", "walnuts"]
    shopping_list = shopping_list ++ ["banana", "banana", "banana"]
    shopping_list
  end

  def shopping_list_with_quantities do
    list = [] ++ [milk: 1, eggs: 12]
    list = list ++ [bars_of_butter: 2, candies: 10]
    list = list -- [bars_of_butter: 2]
    list = list -- [candies: 10]
    list = list ++ [candies: 5]
    list
  end

  def copy_file do
    "copy_example"
  end

  def family_tree do
    han = %{
      name: "Han",
      status: :grand_parent,
      age: 81,
      parents: []
    }

    leia = %{
      name: "Leia",
      status: :grand_parent,
      age: 82,
      parents: []
    }

    uther = %{
      name: "Uther",
      status: :parent,
      age: 56,
      parents: [han, leia]
    }

    bob = %{
      name: "Bob",
      status: :grand_parent,
      age: 68,
      parents: []
    }

    bridget = %{
      name: "Bridget",
      status: :grand_parent,
      age: 70
    }

    ygraine = %{
      name: "Ygraine",
      status: :parent,
      age: 45,
      parents: [bob, bridget]
    }

    %{
      name: "Arthur",
      status: :child,
      age: 22,
      parents: [
        uther,
        ygraine
      ]
    }
  end

  def naming_numbers do
    fn integer ->
      list = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
      Enum.at(list, integer)
    end
  end

  def numbering_names do
    fn name ->
      list = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
      Enum.find_index(list, fn each -> each == String.downcase(name) end)
    end
  end

  defmodule Character do
    @enforce_keys [:name]
    defstruct @enforce_keys ++ [:class, :weapon]
  end

  def define_character_struct do
    Character
  end

  def character_structs do
    arthur = %Character{name: "Arthur", weapon: "sword", class: "warrior"}
    gandalf = %Character{name: "Gandalf", weapon: "staff", class: "wizard"}
    jarlaxle = %Character{name: "Jarlaxle", weapon: "daggers", class: "rogue"}

    [arthur, gandalf, jarlaxle]
  end

  defmodule Dialogue do
    def greet(character) do
      "Hello, my name is #{character.name}."
    end

    def attack(character, enemy) do
      "#{character.name} attacks #{enemy} with a #{character.weapon}."
    end

    def relinquish_weapon(character) do
      case character.class do
        "rogue" -> "Fine, have my #{character.weapon}. I have more hidden anyway."
        "wizard" -> "You would not part an old man from his walking stick?"
        "warrior" -> "Have my #{character.weapon} then!"
        _ -> "My precious!"
      end
    end

    def matching_weapon(character) do
      case {character.class, character.weapon} do
        {"wizard", "staff"} -> "My lovely magical staff"
        {"rogue", "daggers"} -> "Hidden and deadly."
        {"warrior", "sword"} -> "My noble sword!"
        {_, nil} -> "I'm unarmed!"
        {_, _} -> "I'm not sure a #{character.weapon} suits a #{character.class}."
      end
    end
  end

  def character_dialogue do
    Dialogue
  end

  defmodule Pokemon do
    defstruct [:name, :type, :speed, health: 20, attack: 5]
  end

  def define_pokemon_struct do
    Pokemon
  end

  def pokemon_structs do
    charmander = %Pokemon{name: "Charmander", type: :fire, speed: 20}
    bulbasaur = %Pokemon{name: "Bulbasaur", type: :grass, speed: 15}
    squirtle = %Pokemon{name: "Squirtle", type: :water, speed: 10}
    [charmander, bulbasaur, squirtle]
  end

  defmodule PokemonBattle do
    def multiplier(pokemon1, pokemon2) do
      case {pokemon1, pokemon2} do
        {:fire, :grass} -> 2
        {:water, :fire} -> 2
        {:grass, :water} -> 2
        {:fire, :water} -> 0.5
        {:water, :grass} -> 0.5
        {:grass, :fire} -> 0.5
        _ -> 1
      end
    end

    def attack(pokemon1, pokemon2) do
      %Pokemon{
        pokemon2
        | health: pokemon2.health - pokemon2.attack * multiplier(pokemon1, pokemon2)
      }
    end

    def battle(pokemon1, pokemon2) do
      # pokemon1 faster or same speed as pokemon2
      pokemon2 =
        if pokemon1.speed >= pokemon2.speed, do: attack(pokemon1, pokemon2), else: pokemon2

      pokemon1 =
        if pokemon1.speed >= pokemon2.speed and pokemon2.health > 0,
          do: attack(pokemon2, pokemon1),
          else: pokemon1

      # pokemon2 faster or same speed as pokemon1
      pokemon1 =
        if pokemon1.speed < pokemon2.speed, do: attack(pokemon2, pokemon1), else: pokemon1

      pokemon2 =
        if pokemon1.speed < pokemon2.speed and pokemon1.health > 0,
          do: attack(pokemon1, pokemon2),
          else: pokemon2

      {pokemon1, pokemon2}
    end
  end

  def pokemon_battle do
    [PokemonBattle, Pokemon]
  end

  defmodule RockPaperScissorsLizardSpock do
    defp beats?(p1, p2) do
      {p1, p2} in [
        {:rock, :paper},
        {:paper, :rock},
        {:scissors, :paper},
        {:rock, :lizard},
        {:lizard, :spock},
        {:scissors, :lizard},
        {:lizard, :paper},
        {:paper, :spock},
        {:spock, :rock}
      ]
    end

    def play(p1, p2) do
      cond do
        beats?(p1, p2) -> "#{p1} beats #{p2}."
        beats?(p2, p1) -> "#{p2} beats #{p1}."
        true -> "tie game, play again?"
      end
    end
  end

  def rock_paper_scissors_lizard_spock do
    RockPaperScissorsLizardSpock
  end

  def card_count_four do
    1
  end

  def card_count_king do
    4
  end

  def card_count_random do
    random_card = Utils.random(2..14)

    count = 0

    next_count = (random_card <= 6 && count + 1) || (random_card >= 10 && count - 1) || count
    [random_card, next_count]
  end



  defmodule CustomGame do
    @enforce_keys [:rock, :paper, :scissors]
    defstruct @enforce_keys

    def new(rock, paper, scissors) do
      %__MODULE__{rock: rock, paper: paper, scissors: scissors}
    end

    def convert_choice(game, choice) do
      %{rock: rock, paper: paper, scissors: scissors} = game

      case choice do
        ^rock -> :rock
        ^paper -> :paper
        ^scissors -> :scissors
      end
    end

    def beats?(game, player1, player2) do
      {convert_choice(game, player1), convert_choice(game, player2)} in [
        {:rock, :scissors},
        {:paper, :rock},
        {:scissors, :paper}
      ]
    end

    def play(game, player1, player2) do
      cond do
        beats?(game, player1, player2) ->
          "#{player1} beats #{player2}"

        beats?(game, player2, player1) ->
          "#{player2} beats #{player1}"

        true ->
          "draw"
      end
    end
  end

  def custom_rps do
    CustomGame
  end

  defmodule FizzBuzz do
    def run(range) do
      Enum.map(range, fn integer ->
        cond do
          rem(integer, 15) == 0 -> "fizzbuzz"
          rem(integer, 5) == 0 -> "buzz"
          rem(integer, 3) == 0 -> "fizz"
          true -> integer
        end
      end)
    end
  end

  def fizzbuzz do
    FizzBuzz
  end

  defmodule VoterCount do
    def count(list_of_votes, vote) do
      Enum.count(list_of_votes, fn each -> each == vote end)
    end
  end

  def voter_count do
    VoterCount
  end

  defmodule Anagram do
    def sort_string(string) do
      String.split(string, "", trim: true) |> Enum.sort() |> Enum.join()
    end

    def is_anagram?(word, possible_anagram) do
      sort_string(word) == sort_string(possible_anagram)
    end

    def filter_anagrams(word, possible_anagrams) do
      Enum.filter(possible_anagrams, fn each -> is_anagram?(word, each) end)
    end
  end

  def is_anagram do
    Anagram
  end

  defmodule BottlesOfSoda do
    def singular(container) do
      String.slice(container, 0..(String.length(container) - 2))
    end

    def verse(2, beverage, container) do
      "2 #{container} of #{beverage} on the wall.\n2 #{container} of #{beverage}.\nTake one down, pass it around.\n1 #{singular(container)} of #{beverage} on the wall."
    end

    def verse(1, beverage, container) do
      "1 #{singular(container)} of #{beverage} on the wall.\n1 #{singular(container)} of #{beverage}.\nTake one down, pass it around.\n0 #{container} of #{beverage} on the wall."
    end

    def verse(0, beverage, container) do
      "No more #{container} of #{beverage} on the wall, no more #{container} of #{beverage}.\nGo to the store and buy some more, 99 #{container} of #{beverage} on the wall."
    end

    def verse(line, beverage, container) do
      "#{line} #{container} of #{beverage} on the wall.\n#{line} #{container} of #{beverage}.\nTake one down, pass it around.\n#{line - 1} #{container} of #{beverage} on the wall."
    end

    def on_the_wall(range \\ 99..0, beverage \\ "soda", container \\ "bottles") do
      Enum.map(range, fn line -> verse(line, beverage, container) end)
    end
  end

  def bottles_of_soda do
    BottlesOfSoda
  end

  def bottles_of_blank do
    BottlesOfSoda
  end

  defmodule Item do
    defstruct [:type, :effect, :level, :size, :style]
  end

  def item_generator_item do
    Item
  end

  def item_generator do
    types = [
      "sword",
      "halberd",
      "crossbow",
      "hammer",
      "mace",
      "longsword",
      "shortsword",
      "longbow"
    ]

    effects = [
      "protection",
      "healing",
      "speed",
      "power",
      "jump"
    ]

    styles = ["holy", "dark", "heroic", "crude", "mundane", "lavish"]
    sizes = 1..10
    levels = 1..100

    for type <- types, effect <- effects, style <- styles, size <- sizes, level <- levels do
      %Item{type: type, effect: effect, style: style, size: size, level: level}
    end
  end

  defmodule Search do
    def all_items(items, filters) do
      inclusive = Keyword.get(filters, :inclusive)

      if inclusive do
        inclusive_filter(items, Keyword.delete(filters, :inclusive))
      else
        exclusive_filter(items, Keyword.delete(filters, :inclusive))
      end
    end

    defp exclusive_filter(items, filters) do
      Enum.filter(items, fn each ->
        Enum.all?(filters, fn {filter, value} -> Map.get(each, filter) == value end)
      end)
    end

    defp inclusive_filter(items, filters) do
      Enum.filter(items, fn each ->
        Enum.any?(filters, fn {filter, value} -> Map.get(each, filter) == value end)
      end)
    end
  end

  def item_generator_search do
    Search
  end

  defmodule CustomEnum do
    def map(collection, function) do
      Enum.reduce(collection, [], fn each, acc ->
        [function.(each) | acc]
      end)
      |> Enum.reverse()
    end

    def each(collection, function) do
      Enum.reduce(collection, fn each, _acc ->
        function.(each)
        :ok
      end)
    end

    def filter(collection, function) do
      Enum.reduce(collection, [], fn each, acc ->
        if function.(each) do
          [each | acc]
        else
          acc
        end
      end)
      |> Enum.reverse()
    end

    def sum(collection) do
      Enum.reduce(collection, 0, fn each, acc -> acc + each end)
    end
  end

  def custom_enum do
    CustomEnum
  end

  defmodule VoterTally do
    def tally(votes) do
      Enum.reduce(votes, %{}, fn
        {each, value}, acc ->
          Map.update(acc, each, value, fn existing_value -> existing_value + value end)

        each, acc ->
          Map.update(acc, each, 1, fn existing_value -> existing_value + 1 end)
      end)
    end
  end

  def voter_tally do
    VoterTally
  end

  def voter_power do
    VoterTally
  end

  defmodule Measurements do
    def increased(measurements) do
      [head | tail] = measurements

      {_prev, sum} =
        Enum.reduce(tail, {head, 0}, fn each, {prev, acc} ->
          {each, (prev < each && acc + 1) || acc}
        end)

      sum
    end

    def increased_by(measurements) do
      [head | tail] = measurements

      {_prev, sum} =
        Enum.reduce(tail, {head, 0}, fn each, {prev, acc} ->
          {each, (prev < each && acc + each - prev) || acc}
        end)

      sum
    end

    def increments(measurements) do
      [head | tail] = measurements

      {_prev, acc} =
        Enum.reduce(tail, {head, []}, fn each, {prev, acc} ->
          {each, [each - prev | acc]}
        end)

      Enum.reverse(acc)
    end

    def average(measurements) do
      Enum.sum(measurements) / length(measurements)
    end
  end

  def measurements do
    Measurements
  end

  def keyword_list_hero do
    [name: "", secret_identity: ""]
  end

  def non_standard_key_map do
    %{1 => 2, %{} => :example}
  end

  def atom_key_map do
    %{key: "value"}
  end

  def string_key_map do
    %{"key" => "value"}
  end

  def access_map do
    map = %{hello: "world"}
    value = map.hello
    value
  end

  def update_map do
    initial_map = %{example_key: "value"}
    updated_map = %{initial_map | example_key: "new value"}
    updated_map
  end

  def remainder do
    rem(10, 3)
  end

  def exponents do
    10 ** 214
  end

  def bedmas do
    (20 + 20) * 20
  end

  def gcd do
    Integer.gcd(10, 15)
  end

  def string_at do
    String.at("hello", 2)
  end

  def merged_map do
    Map.merge(%{one: 1}, %{two: 2})
  end

  defmodule BingoWinner do
    def is_winner?(board) do
      Enum.any?(board, fn row -> row == ["X", "X", "X"] end) ||
        Enum.all?(board, fn row -> row == ["X", nil, nil] end) ||
        Enum.all?(board, fn row -> row == [nil, "X", nil] end) ||
        Enum.all?(board, fn row -> row == [nil, nil, "X"] end) ||
        board == [["X", nil, nil], [nil, "X", nil], [nil, nil, "X"]] ||
        board == [[nil, nil, "X"], [nil, "X", nil], ["X", nil, nil]]
    end
  end

  def bingo_winner do
    BingoWinner
  end

  defmodule Bingo do
    def is_winner?(board, called_numbers) do
      [row1, row2, row3] = board
      [r1c1, _, r1c3] = row1
      [_, r2c2, _] = row2
      [r3c1, _, r3c3] = row3

      Enum.any?(board, fn row -> Enum.all?(row, fn number -> number in called_numbers end) end) ||
        Enum.all?(board, fn row -> Enum.at(row, 0) in called_numbers end) ||
        Enum.all?(board, fn row -> Enum.at(row, 1) in called_numbers end) ||
        Enum.all?(board, fn row -> Enum.at(row, 2) in called_numbers end) ||
        (r1c1 in called_numbers && r2c2 in called_numbers && r3c3 in called_numbers) ||
        (r3c1 in called_numbers && r2c2 in called_numbers && r1c3 in called_numbers)
    end
  end

  def bingo do
    Bingo
  end

  def is_type do
    [
      is_map(%{}),
      is_binary(""),
      is_integer(1),
      is_float(1.0),
      is_boolean(true),
      is_list([]),
      is_tuple({})
    ]
  end

  def pipe_operator do
    add = fn int1, int2 -> int1 + int2 end
    multiply = fn int1, int2 -> int1 * int2 end
    subtract = fn int1, int2 -> int1 - int2 end

    10
    |> add.(2)
    |> multiply.(5)
    |> subtract.(4)
  end

  defmodule Filter do
    def integers(list) do
      Enum.filter(list, &is_integer/1)
    end

    def floats(list) do
      Enum.filter(list, &is_float/1)
    end

    # both floats and integers
    def numbers(list) do
      Enum.filter(list, &is_number/1)
    end

    def atoms(list) do
      Enum.filter(list, &is_atom/1)
    end

    def lists(list) do
      Enum.filter(list, &is_list/1)
    end

    def maps(list) do
      Enum.filter(list, &is_map/1)
    end

    def keyword_lists(list) do
      Enum.filter(list, &Keyword.keyword?/1)
    end
  end

  def filter_by_type, do: Filter

  defmodule TicTakToe do
    def play(board, coordinate, symbol) do
      {row, column} = coordinate
      List.replace_at(board, row, List.replace_at(Enum.at(board, row), column, symbol))
    end
  end

  def tic_tak_toe, do: TicTakToe

  def datetime_new, do: DateTime.new!(~D[1938-04-18], ~T[12:00:00])

  def datetime_today, do: DateTime.utc_now()
  def datetime_tomorrow, do: DateTime.utc_now() |> DateTime.add(60 * 60 * 24, :second)

  def datetime_compare do
    date = DateTime.new!(~D[1938-04-18], ~T[12:00:00])
    DateTime.compare(DateTime.utc_now(), date)
  end

  def datetime_diff do
    date1 = DateTime.new!(~D[2000-01-01], ~T[12:00:00])
    date2 = DateTime.new!(~D[2010-02-02], ~T[12:00:00])

    DateTime.diff(date2, date1)
  end

  defmodule Itinerary do
    def has_time?(start, finish, activities) do
      time_between = DateTime.diff(finish, start)

      seconds_of_activities =
        Enum.reduce(activities, 0, fn
          {:minute, int}, acc -> acc + int * 60
          {:hour, int}, acc -> acc + int * 60 * 60
        end)

      time_between >= seconds_of_activities
    end
  end

  def itinerary, do: Itinerary

  defmodule Timeline do
    def generate(dates) do
      dates |> dates_to_datetimes() |> datetimes_to_days()
    end

    defp datetimes_to_days(datetimes) do
      {_, day_list} =
        Enum.reduce(tl(datetimes), {hd(datetimes), []}, fn current, {prev, acc} ->
          diff_in_days = DateTime.diff(current, prev) / 60 / 60 / 24
          {current, [diff_in_days | acc]}
        end)

      Enum.reverse(day_list)
    end

    defp dates_to_datetimes(dates) do
      Enum.map(dates, fn each ->
        [year, month, day] = each |> String.split("-") |> Enum.map(&String.to_integer/1)

        DateTime.new!(Date.new!(year, month, day), Time.utc_now())
      end)
    end
  end

  def timeline, do: Timeline

  defmodule School do
    def must_register(students, year) do
      latest_birthday = Date.new!(year - 5, 12, 31)
      earliest_birthday = Date.new!(year - 16, 1, 1)

      Enum.filter(
        students,
        fn each ->
          Date.compare(each.birthday, earliest_birthday) in [:gt, :eq] and
            Date.compare(each.birthday, latest_birthday) in [:lt, :eq]
        end
      )
    end

    def grades(students, year) do
      Enum.reduce(students, %{}, fn each, acc ->
        grade =
          case year - each.birthday.year do
            6 -> :grade1
            7 -> :grade2
            8 -> :grade3
            9 -> :grade4
            10 -> :grade5
          end

        Map.update(acc, grade, [each], fn list -> list ++ [each] end)
      end)
    end
  end

  def school_must_register, do: School
  def school_grades, do: School

  defmodule Percent do
    def display(percent) when percent > 0 and percent <= 100 do
      "#{percent}%"
    end
  end

  def percent, do: Percent

  defmodule Say do
    def hello(name) when is_binary(name) do
      "Hello, #{name}."
    end
  end

  def say_guards, do: Say

  def case_match do
    case [1, 2, 3] do
      [_, _, 3] -> "A"
      _ -> "default"
    end
  end

  defmodule Hello do
    def everyone([_, _, _ | _tail]) do
      "Hello, everyone!"
    end
  end

  def hello_match, do: Hello

  defmodule Points do
    def tally(scores) do
      with [one, two] <- scores,
           true <- is_integer(one) and is_integer(two),
           true <- one >= 10 and two >= 10 do
        one + two
      else
        _ -> {:error, :invalid}
      end
    end
  end

  def with_points, do: Points

  defmodule CustomEnumMap do
    def map(list, function, acc \\ []) do
      case list do
        [] -> acc
        [head | tail] -> map(tail, function, [function.(head) | acc])
      end
    end
  end

  def custom_enum_map do
    CustomEnumMap
  end

  defmodule LucasNumbers do
    def l(1), do: 2
    def l(2), do: 1
    def l(n), do: l(n - 1) + l(n - 2)

    def generate(n) do
      Enum.map(1..n, fn each -> l(each) end)
    end
  end

  def lucas_numbers do
    LucasNumbers
  end

  defmodule Pascal do
    defp row(1), do: [1]
    defp row(2), do: [1, 1]

    defp row(n) do
      generate_row(row(n - 1), [1])
    end

    defp generate_row(previous_row, acc \\ []) do
      case previous_row do
        [first, second | tail] -> generate_row([second | tail], [first + second | acc])
        _ -> [1 | acc]
      end
    end

    def of(n) do
      Enum.map(1..n, &row/1)
    end
  end

  def pascal do
    Pascal
  end

  defmodule RecursiveEnum do
    def reverse(list) do
      reduce(list, [], fn each, acc -> [each | acc] end)
    end

    def reduce(list, acc, function) do
      case list do
        [head | tail] -> reduce(tail, function.(head, acc), function)
        [] -> acc
      end
    end

    def map(list, function) do
      list |> reduce([], fn each, acc -> [function.(each) | acc] end) |> reverse()
    end

    def each(list, function) do
      case list do
        [head | tail] ->
          function.(head)
          each(tail, function)

        [] ->
          :ok
      end
    end

    def filter(list, function) do
      list
      |> reduce([], fn each, acc -> if function.(each), do: [each | acc], else: acc end)
      |> reverse()
    end
  end

  def enum_recursion do
    RecursiveEnum
  end

  defmodule Rollable do
    def replace(string) do
      Regex.replace(~r/\d+d\d+/, string, fn each ->
        "[#{each}](https://www.google.com/search?q=roll+#{each})"
      end)
    end
  end

  def rollable_expressions do
    Rollable
  end

  defmodule CaesarCypher do
    def decode(string, key) do
      String.to_charlist(string)
      |> Enum.map(fn char ->
        cond do
          char < ?a or ?z < char ->
            char

          char - key < ?a ->
            ?z - (?a - (char - key)) + 1

          true ->
            char - key
        end
      end)
      |> List.to_string()
    end

    def encode(string, key) do
      String.to_charlist(string)
      |> Enum.map(fn char ->
        cond do
          char < ?a or ?z < char ->
            char

          char + key > ?z ->
            ?a + (char + key - ?z) - 1

          true ->
            char + key
        end
      end)
      |> List.to_string()
    end
  end

  def caesar_cypher do
    CaesarCypher
  end

  defmodule Classified do
    def redact(string) do
      string
      |> String.replace(~r/Peter Parker/, "REDACTED")
      |> String.replace(~r/Bruce Wayne/, "REDACTED")
      |> String.replace(~r/Clark Kent/, "REDACTED")
      |> String.replace(~r/\d{3}-\d{3}-\d{4}/, "REDACTED")
      |> String.replace(~r/\w+@\w+\.\w+/, "REDACTED")
      |> String.replace(~r/(?<!\d)\d{4}(?!\d)/, "REDACTED")
    end
  end

  def classified do
    Classified
  end

  defmodule PhoneNumber do
    def parse(string) do
      new = fn _, area, prefix, line_number ->
        "#{area}-#{prefix}-#{line_number}"
      end

      string = Regex.replace(~r/(\d{3})(\d{3})(\d{4})/, string, new)
      string = Regex.replace(~r/(\d{3})\s(\d{3})\s(\d{4})/, string, new)
      string = Regex.replace(~r/\((\d{3})\)-(\d{3})-(\d{4})/, string, new)
      string = Regex.replace(~r/\((\d{3})\) (\d{3}) (\d{4})/, string, new)
      Regex.replace(~r/\((\d{3})\)(\d{3})-(\d{4})/, string, new)
    end
  end

  def phone_number_parsing do
    PhoneNumber
  end

  def convert_phone do
    fn string ->
      Regex.replace(~r/(#\d{3})(\d{3})(\d{4})/, string, fn _, area, prefix, line_number ->
        "#{area}-#{prefix}-#{line_number}"
      end)
    end
  end

  def obfuscate_phone do
    fn phone_number ->
      Regex.replace(~r/\d{3}-(\d{3})-\d{4}/, phone_number, fn _, prefix ->
        "XXX-#{prefix}-XXXX"
      end)
    end
  end

  defmodule Email do
    def validate(email) do
      Regex.match?(~r/\S+@\S+\.\S+/, email)
    end
  end

  def email_validation do
    Email
  end

  defmodule Cypher do
    def shift(string) do
      string
      |> String.to_charlist()
      |> Enum.map(fn
        ?z -> ?a
        char -> char + 1
      end)
      |> List.to_string()
    end
  end

  def cypher do
    Cypher
  end

  defmodule MetricMeasurements do
    def convert(from, to) do
      centimeters =
        case from do
          {:millimeter, amount} -> amount * 0.1
          {:centimeter, amount} -> amount
          {:meter, amount} -> amount * 100
          {:kilometer, amount} -> amount * 100_000
          {:inch, amount} -> amount * 2.54
          {:feet, amount} -> amount * 30
          {:yard, amount} -> amount * 91
          {:mile, amount} -> amount * 160_000
        end

      case to do
        :millimeter -> {:millimeter, centimeters / 0.1}
        :centimeter -> {:centimeter, centimeters}
        :meter -> {:meter, centimeters / 100}
        :kilometer -> {:kilometer, centimeters / 100_000}
        :inch -> {:inch, centimeters / 2.54}
        :feet -> {:feet, centimeters / 30}
        :yard -> {:yard, centimeters / 91}
        :mile -> {:mile, centimeters / 160_000}
      end
    end
  end

  def metric_measurements do
    MetricMeasurements
  end

  defmodule Money do
    defstruct [:amount, :currency]

    def new(amount, currency) do
      %__MODULE__{amount: amount, currency: currency}
    end

    def convert(%__MODULE__{amount: amount, currency: from_currency}, to_currency) do
      cad_amount =
        case from_currency do
          :CAD -> amount
          :US -> amount * 1.29
          :EUR -> amount * 1.39
        end

      new_currency_amount =
        case to_currency do
          :CAD -> cad_amount
          :US -> cad_amount / 1.29
          :EUR -> cad_amount / 1.39
        end

      Money.new(round(new_currency_amount), to_currency)
    end

    def add(%__MODULE__{} = money1, %__MODULE__{} = money2)
        when money1.currency == money2.currency do
      Money.new(money1.amount + money2.amount, money1.currency)
    end

    def subtract(%__MODULE__{} = money1, %__MODULE__{} = money2)
        when money1.currency == money2.currency do
      Money.new(money1.amount - money2.amount, money1.currency)
    end

    def multiply(%__MODULE__{} = money1, multiplier) do
      Money.new(round(money1.amount * multiplier), money1.currency)
    end
  end

  def money do
    Money
  end


  defmodule Pet do
    @callback speak() :: String.t()
  end

  defmodule Dog do
  end

  defmodule Cat do
  end

  def behaviours do
    [Pet, Dog, Cat]
  end

  defmodule RPGCharacter do
    defstruct [:class, health: 100, speed: 20, equipment: []]
  end

  def rpg_character do
    RPGCharacter
  end

  defmodule HealingPotion do
    defstruct level: 1
  end

  def rpg_healing_potion, do: HealingPotion

  defmodule Armor do
    defstruct defense: 10
  end

  def rpg_armor, do: Armor

  defprotocol Consumable do
    def consume(item, character)
  end

  defimpl Consumable, for: HealingPotion do
    def consume(%{level: level}, character) do
      %RPGCharacter{
        health: character.health + level * 10,
        speed: character.speed,
        equipment: character.equipment,
        class: character.class
      }
    end
  end

  def rpg_consumable, do: [Consumable, RPGCharacter, HealingPotion]

  defprotocol Wearable do
    def wear(item, character)
    def remove(item, character)
  end

  defimpl Wearable, for: Armor do
    def wear(item, character) do
      %RPGCharacter{
        health: character.health + item.defense,
        speed: character.speed - 5,
        class: character.class,
        equipment: [item | character.equipment]
      }
    end

    def remove(item, character) do
      %RPGCharacter{
        health: character.health - item.defense,
        speed: character.speed + 5,
        class: character.class,
        equipment: character.equipment -- [item]
      }
    end
  end

  def rpg_wearable, do: [Wearable, RPGCharacter, Armor]

  # Enter your answer below

  defprotocol Math do
    def add(a, b)
    def subtract(a, b)
    def multiply(a, b)
  end

  defimpl Math, for: Integer do
    def add(a, b) do
      a + b
    end

    def subtract(a, b) do
      a - b
    end

    def multiply(a, b) do
      a * b
    end
  end

  defimpl Math, for: Float do
    def add(a, b) do
      a + b
    end

    def subtract(a, b) do
      a - b
    end

    def multiply(a, b) do
      a * b
    end
  end

  defimpl Math, for: List do
    def add(a, b) do
      a ++ b
    end

    def subtract(a, b) do
      a -- b
    end

    def multiply(list, integer) do
      list
      |> List.duplicate(integer)
      |> List.flatten()
    end
  end

  defimpl Math, for: Range do
    def add(a1..b1, a2..b2) do
      (a1 + a2)..(b1 + b2)
    end

    def subtract(a1..b1, a2..b2) do
      (a1 - a2)..(b1 - b2)
    end

    def multiply(a1..b1, a2..b2) do
      (a1 * a2)..(b1 * b2)
    end
  end

  defimpl Math, for: BitString do
    def add(a, b) do
      a <> b
    end

    def subtract(a, b) do
      Enum.reduce(String.graphemes(b), a, fn each, acc ->
        String.replace(acc, each, "", global: false)
      end)
    end

    def multiply(a, b) do
      String.graphemes(a) |> Enum.map(fn each -> each ++ String.graphemes(b) end) |> Enum.join()
    end
  end

  def math_module, do: Math

  defmodule Charmander do
    defstruct hp: 39, attack: 52, defense: 43
  end

  defmodule Charmeleon do
    defstruct hp: 58, attack: 64, defense: 58
  end

  defmodule Charizard do
    defstruct hp: 78, attack: 84, defense: 78
  end

  def pokemon_evolution_structs, do: [Charmander, Charmeleon, Charizard]

  defprotocol Evolvable do
    def evolve(pokemon)
  end

  defimpl Evolvable, for: Charmander do
    def evolve(_) do
      %Charmeleon{}
    end
  end

  defimpl Evolvable, for: Charmeleon do
    def evolve(_) do
      %Charizard{}
    end
  end

  def evolvable, do: [Evolvable, Charmander, Charmeleon, Charizard]

  defmodule Barbarian do
    defstruct []
  end

  defmodule Wizard do
    defstruct []
  end

  defprotocol BattleCharacter do
    def can_attack?(character, origin, target)
  end

  defimpl BattleCharacter, for: Wizard do
    def can_attack?(_character, {init_x, init_y}, {x, y}) do
      x_diff = init_x - x
      y_diff = init_y - y

      init_x == x || init_y == y || abs(x_diff) == abs(y_diff)
    end
  end

  defimpl BattleCharacter, for: Barbarian do
    def can_attack?(_character, {init_x, init_y}, {x, y}) do
      x_diff = init_x - x
      y_diff = init_y - y

      abs(x_diff) <= 2 && abs(y_diff) <= 2
    end
  end

  def battle_map, do: [BattleCharacter, Barbarian, Wizard]
end
