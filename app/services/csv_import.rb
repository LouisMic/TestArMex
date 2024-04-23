class CsvImport
  require "csv"

  def initialize(file)
    @filepath = File.open(file)

  end

  def call
    Booking.destroy_all
    options = { headers: true, col_sep: ';' }
    CSV.foreach(@filepath, **options) do |row|
      user = user_definition(row)
      show = show_definition(row)
      perf = performance_definition(row, show)
      booking = booking_definition(row, user, perf)
      ticket = ticket_definition(row, booking)
    end
  end

  private

  def user_definition(csv_row)
    user = {
      first_name: csv_row["Prenom"],
      last_name: csv_row["Nom"],
      email: csv_row["Email"],
      adress: csv_row["Adresse"],
      postal_code: csv_row["Code postal"],
      country: csv_row["Country"],
      age: csv_row["Age"] || nil,
      gender: csv_row["Sexe"] || nil
    }
    User.find_or_create_by!(user)
  end

  def show_definition(csv_row)
    Show.find_or_create_by!(name: csv_row["Spectacle"])
  end

  def performance_definition(csv_row, show)
    performance = {
      start_date: format_date(csv_row["Date representation"], csv_row["Heure representation"]),
      end_date: format_date(csv_row["Date fin representation"], csv_row["Heure fin representation"]),
      show: show
    }
    Performance.find_or_create_by!(performance)
  end

  def booking_definition(csv_row, user, performance)
    booking = {
      booking_date: format_date(csv_row["Date reservation"].split(" ").first, csv_row["Heure reservation"]),
      channel: csv_row["Filiere de vente"],
      booking_type: csv_row["Type de produit"],
      user: user,
      performance: performance
    }
    Booking.find_or_create_by!(booking)
  end

  def ticket_definition(csv_row, booking)
    Ticket.create!(price: csv_row["Prix"], booking: booking)
  end

  def format_date(date, hour)
    formatted_date = date.size == 8 ? "#{date.first(6)}20#{date.last(2)}" : date
    DateTime.strptime("#{formatted_date} #{hour}", "%d/%m/%Y %H:%M:%S")
  end
end
