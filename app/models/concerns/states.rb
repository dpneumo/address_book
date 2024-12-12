# frozen_string_literal: true

module States
  extend ActiveSupport::Concern

  class_methods do
    def state_select_opts
      name2abbrev
    end

    def state_abbreviations
      @abbrevs ||= name2abbrev.map {|pair| pair.last }
    end

    def state_names
      @names ||= name2abbrev.map {|pair| pair.first }
    end

    def name2abbrev
      [
        %w{Alabama AL},
        %w{Alaska AK},
        %w{American\ Samoa AS},
        %w{Arizona AZ},
        %w{Arkansas AR},
        %w{California CA},
        %w{Colorado CO},
        %w{Connecticut CT},
        %w{Delaware DE},
        %w{Washington\ DC DC},
        %w{Federated\ States\ of\ Micronesia FM},
        %w{Florida FL},
        %w{Georgia GA},
        %w{Guam GU},
        %w{Hawaii HI},
        %w{Indiana ID},
        %w{Illinois IL},
        %w{Indiana IN},
        %w{Iowa IA},
        %w{Kansas KS},
        %w{Kentucky KY},
        %w{Louisiana LA},
        %w{Maine ME},
        %w{Marshall\ Islands MH},
        %w{Maryland MD},
        %w{Massachusets MA},
        %w{Michigan MI},
        %w{Minnesota MN},
        %w{Mississippi MS},
        %w{Missouri MO},
        %w{Montana MT},
        %w{North\ Carolina NC},
        %w{Nebraska NE},
        %w{Nevada NV},
        %w{New\ Hampshire NH},
        %w{New\ Jersey NJ},
        %w{New\ Mexico NM},
        %w{New\ York NY},
        %w{North\ Dakota ND},
        %w{Northern\ Mariana\ Islands MP},
        %w{Ohio OH},
        %w{Oklahoma OK},
        %w{Oregon OR},
        %w{Palau PW},
        %w{Pennsylvania PA},
        %w{Puerto\ Rico PR},
        %w{Rhode\ Island RI},
        %w{South\ Carolina SC},
        %w{South\ Dakota SD},
        %w{Tennessee TN},
        %w{Texas TX},
        %w{Utah UT},
        %w{Vermont VT},
        %w{Virgin\ Islands VI},
        %w{Virginia VA},
        %w{Washington WA},
        %w{West\ Virginia WV},
        %w{Wisconsin WI},
        %w{Wyoming WY}
      ]
    end
  end
end