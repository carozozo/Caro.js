do ->
describe 'String', ->
  it 'addHead', ->
    r = caro.addHead('false', 'fa')
    r2 = caro.addHead('False', 'is')
    r.should.eq 'false'
    r2.should.eq 'isFalse'

  it 'addTail', ->
    r = caro.addTail('moon', 'on')
    r2 = caro.addTail('moon', 'Day')
    r.should.eq 'moon'
    r2.should.eq 'moonDay'

  it 'brToWrap', ->
    r = caro.brToWrap('this is<br />wrap content.')
    r.should.eq 'this is\nwrap content.'

  it 'insertStr', ->
    r = caro.insertStr('Lift is good', ' so', 7)
    r.should.eq 'Lift is so good'
    r = caro.insertStr('I love my', ' dog')
    r.should.eq 'I love my dog'

  it 'lowerStr', ->
    r = caro.lowerStr('I AM CARO')
    r2 = caro.lowerStr('I AM CARO', 5)
    r3 = caro.lowerStr('I AM CARO', 5, 6)
    r4 = caro.lowerStr('I AM CARO', (letter) ->
      return true if letter isnt 'C'
    )
    r5 = caro.lowerStr('I AM CARO', (letter, i) ->
      return true if i > 1
    )
    r.should.eq 'i am caro'
    r2.should.eq 'I AM caro'
    r3.should.eq 'I AM cARO'
    r4.should.eq 'i am Caro'
    r5.should.eq 'I am caro'

  it 'replaceAll', ->
    r = caro.replaceAll('I*am*{Caro}.', '*', '-')
    r2 = caro.replaceAll('I-am-Caro.', '-', '@')
    r.should.eql 'I-am-{Caro}.'
    r2.should.eql 'I@am@Caro.'

  it 'replaceLast', ->
    r = caro.replaceLast('I-am-Caro.', '-', ' ')
    r2 = caro.replaceLast('I am Caro not Colo.', 'o', 'a')
    r.should.eql 'I-am Caro.'
    r2.should.eql 'I am Caro not Cola.'

  it 'splitByWrap', ->
    r = caro.splitByWrap('''
      I love
      my mother
      and
      my father
    ''')
    r.should.eql ['I love', 'my mother', 'and', 'my father']

  it 'splitStr', ->
    r = caro.splitStr('i am caro', ' ')
    r2 = caro.splitStr('I love ~~ Snoopy !~!', ['~', ' '])
    r.should.eql ['i', 'am', 'caro']
    r2.should.eql ['I', 'love', '', '', '', 'Snoopy', '!', '!']

  it 'strToBool', ->
    r = caro.strToBool('false')
    r2 = caro.strToBool('FALSE')
    r3 = caro.strToBool('123')
    r4 = caro.strToBool('')
    r.should.be.false
    r2.should.be.false
    r3.should.be.true
    r4.should.be.false

  it 'upperStr', ->
    r = caro.upperStr('I am Caro')
    r2 = caro.upperStr('i am caro', 5)
    r3 = caro.upperStr('i am caro', 5, 6)
    r4 = caro.upperStr('i am caro', (letter) ->
      return true if letter is 'i' or letter is 'c'
    )
    r5 = caro.upperStr('i am caro', (letter, i) ->
      return true if i < 1
    )
    r.should.eq 'I AM CARO'
    r2.should.eq 'i am CARO'
    r3.should.eq 'i am Caro'
    r4.should.eq 'I am Caro'
    r5.should.eq 'I am caro'

  it 'wrapToBr', ->
    r = caro.wrapToBr('''this is
      wrap content.
    ''')
    r.should.eq 'this is<br />wrap content.'