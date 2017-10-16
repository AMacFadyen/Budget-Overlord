require_relative('../models/account.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')

require 'pry-byebug'

Tag.delete_all()
Merchant.delete_all()
Account.delete_all()
Transaction.delete_all()

account1= Account.new({
    'name' => 'Terry-test',
    'budget' => 400
    })
account1.save()


tag1= Tag.new({
    'name' => 'food'
    })
tag2= Tag.new({
    'name' => 'clothes'
    })
tag3= Tag.new({
    'name' => 'bills'
    })
tag4= Tag.new({
    'name' => 'gifts'
    })
tag5= Tag.new({
    'name' => 'misc'
    })
tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()

merchant1= Merchant.new({
    'name' => 'Tesco'
})
merchant2= Merchant.new({
    'name' => 'Cass-Art'
})
merchant3= Merchant.new({
    'name' => 'Spitfire'
})
merchant4= Merchant.new({
    'name' => 'Cranberries'
})
merchant5= Merchant.new({
    'name' => 'Amazon'
})
merchant6= Merchant.new({
    'name' => 'FatFace'
})
merchant7= Merchant.new({
    'name' => 'Timpsons'
})
merchant8= Merchant.new({
    'name' => 'Beer-Halle'
})
merchant9= Merchant.new({
    'name' => 'HMV'
})
merchant10= Merchant.new({
    'name' => 'Government'
})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()
merchant5.save()
merchant6.save()
merchant7.save()
merchant8.save()
merchant9.save()
merchant10.save()

transaction1= Transaction.new({
    'cost' => 24,
    'merchant' => merchant1.id,
    'item' => 'Cake and biscuits',
    'tag' => tag1.id
    })
transaction1.save()


binding.pry()
nil
