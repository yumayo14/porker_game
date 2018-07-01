require 'rspec'
require_relative '../src/porker_hand'
require_relative '../src/card'
require_relative '../src/hand'

describe "Hand" do
  describe "役同士の強さの比較" do
    it "ストレートフラッシュはペアより強い" do
      expect(HandCombination::StraightFlash[:score] > HandCombination::Pair[:score]).to eq true
    end
    it "ペアはストレートより強い" do
      expect(HandCombination::Pair[:score] > HandCombination::Straight[:score]).to eq true
    end
    it "ストレートはフラッシュより強い" do
      expect(HandCombination::Straight[:score] > HandCombination::Flash[:score]).to eq true
    end
    it "フラッシュはハイカードより強い" do
      expect(HandCombination::Flash[:score] > HandCombination::HighCard[:score]).to eq true
    end
  end
  describe "2つの手札の役の強さを比較" do
    context "first_handの方が強い場合" do
      first_hand = Hand.new(Card.new("♤", RankPicture::A), Card.new("♧", RankPicture::A))
      first_hand.role = first_hand.cards[0].check_hand_card(first_hand.cards[1])
      second_hand = Hand.new(Card.new("♤", 7), Card.new("♧", 4))
      second_hand.role = second_hand.cards[0].check_hand_card(second_hand.cards[1])
      it "first_handの@winningにGameResult::Winが返り、second_handの@winningにGameResult::Loseが返る" do
        result = first_hand.judge_result(second_hand)
        expect(first_hand.winning).to eq GameResult::Win
        expect(second_hand.winning).to eq GameResult::Lose
      end
    end
    context "second_handの方が強い場合" do
      first_hand = Hand.new(Card.new("♤", 4), Card.new("♧", 5))
      first_hand.role = first_hand.cards[0].check_hand_card(first_hand.cards[1])
      second_hand = Hand.new(Card.new("♤", RankPicture::A), Card.new("♧", RankPicture::A))
      second_hand.role = second_hand.cards[0].check_hand_card(second_hand.cards[1])
      it "first_handの@winningにGameResult::Winが返り、second_handの@winningにGameResult::Wingが返る" do
        result = first_hand.judge_result(second_hand)
        expect(first_hand.winning).to eq GameResult::Lose
        expect(second_hand.winning).to eq GameResult::Win
      end
    end
    context "同じ役の場合" do
      first_hand = Hand.new(Card.new("♤", 5), Card.new("♧", 5))
      first_hand.role = first_hand.cards[0].check_hand_card(first_hand.cards[1])
      second_hand = Hand.new(Card.new("♡", 4), Card.new("♢", 4))
      second_hand.role = second_hand.cards[0].check_hand_card(second_hand.cards[1])
      it "両方の@winningにGameResult::Drawが返る" do
        result = first_hand.judge_result(second_hand)
        expect(first_hand.winning).to eq GameResult::Draw
        expect(second_hand.winning).to eq GameResult::Draw
      end
    end
    context "同じ役同士でも、手札のランクが異なる場合" do
      context "ストレートフラッシュの場合" do
        it "K-Aの組み合わせがもっとも強い" do
        end
        it "A-2の組み合わせがもっとも弱い" do
        end
        it "手札のランクが2枚とも同じ場合は、引き分け" do
        end
      end
      context "ペアの場合" do
        it "Aのペアがもっとも強い" do
          result = first_hand.judge_result(second_hand)
          if econd_hand.role[:score] == @role[:score]
            card_score_judge
            #カードの数値をハッシュで管理したもの{maxとmin}
          end

        end
        it "手札のランクが（2枚）とも同じ場合は引き分け" do
        end
      end
      context "フラッシュの場合" do
        it "ランクが高い手札同士を比較する" do
        end
        it "お互いのランクが高い方の手札のランクが同じだった場合、もう一つの手札を比較する" do
        end
        it "手札のランクが2枚とも同じ場合は、引き分け" do
        end
      end
      context "ハイカードの場合" do
        it "ランクが高い手札同士を比較する" do
        end
        it "お互いのランクが高い方の手札のランクが同じだった場合、もう一つの手札を比較する" do
        end
        it "手札のランクが2枚とも同じ場合は、引き分け" do
        end
      end
    end
  end
end
