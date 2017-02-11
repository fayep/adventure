module Adventure
  Game.instance do
    object :player do
      synonym 'me'
      synonym 'myself'
      synonym 'my'
      synonym 'mine'
      short_description 'A frazzled developer, in need of some sleep'
      include Actions::Player
    end
    object :apartment_door do
      synonym 'door'
      short_description 'The entrance to your home.'
  #    include Actions::Unlockable
      initially do
  #      lock
      end
    end
    object :apartment_key do
      synonym 'key'
      short_description 'A brass housekey on a chain with a fob'
  #    include Actions::Gettable
  #    include Actions::Key
  #    unlocks :apartment_door
    end
    object :office_desk_top_drawer do
      synonym 'top drawer'
      synonym 'drawer'
      short_description 'A shallow drawer for office stationery'
  #    include Actions::Openable
  #    on_open 'the drawer slides open with a scuffing sound'
  #    on_close 'the drawer slides smoothly closed'
      is_visible? true
      is_transparent? false
      initially do
  #      close
        contains :apartment_key
      end
    end
    object :office_desk do
      synonym 'desk'
      short_description 'An office desk'
      is_visible? true
      is_transparent? false
      contains :office_desk_top_drawer
    end
    object :office_cubicle_entrance do
      synonym 'cubicle entrance'
      synonym 'entrance'
  #    include Actions::Portal
      short_description 'Barely more than a gap between panels'
      is_transparent? true
  #    on_move 'you squeeze through the entrance'
    end
    object :office_cubicle do
      short_description 'An office cubicle'
      long_description <<-eodesc
        A nondescript space just large enough for a desk, chair and
        human inhabitant, surrounded on three and a half sides by
        partitions too high to look over.
      eodesc
      contains :office_desk
  #    include Actions::Location
  #    add_exit out: :office_cubicle_entrance, visible: true
      initially do
        contains :player
      end
    end
  end
end
