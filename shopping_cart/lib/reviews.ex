defmodule Reviews do
  def get_reviews() do
    [
      %{rating: 5, text: "What a great product, loved it!", date: ~D[2025-01-01]},
      %{rating: 4, text: "Good, but could be better.", date: ~D[2025-01-02]},
      %{rating: 3, text: "Average experience.", date: ~D[2025-01-03]},
      %{rating: 2, text: "Not what I expected.", date: ~D[2025-01-04]},
      %{rating: 1, text: "Very poor quality.", date: ~D[2025-01-05]}
    ]
  end

  def get_ratings(reviews) do
    Enum.map(reviews, fn review -> review.rating end)
  end

  def get_average_rating(reviews) do
    reviews
    |> get_ratings()
    |> Enum.sum()
    # |> (&(&1 / length(reviews))).()
    |> divide_reviews(reviews)
  end

  defp divide_reviews(sum, reviews) do
    sum / length(reviews)
  end

  def filter_ratings(reviews, rating) do
    Enum.filter(reviews, fn review -> review.rating >= rating end)
  end

  def date_sorted(reviews) do
    Enum.sort_by(reviews, fn review -> review.date end, :desc)
  end

  defp word_list(reviews) do
    Enum.flat_map(reviews, fn review -> String.split(review.text, " ") end)
    |> Enum.map(fn word -> String.downcase(word) end)
  end

  defp word_frequencies(words) do
    Enum.frequencies(words)
  end

  defp top_five_words(word_frequencies) do
    Enum.sort_by(word_frequencies, fn count -> count end, :desc)
    |> Enum.take(5)
  end

  def most_common_words(reviews) do
    word_list(reviews)
    |> word_frequencies()
    |> top_five_words()
  end
end
