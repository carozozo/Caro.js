do ->
describe 'Helper', ->
  it 'isBasicVal', ->
    r = caro.isBasicVal('');
    r2 = caro.isBasicVal({});
    r.should.be.true
    r2.should.be.false

  it 'isEmptyVal', ->
    r = caro.isEmptyVal({}, [], null, '', undefined);
    r2 = caro.isEmptyVal('null');
    r.should.be.true
    r2.should.be.false

  it 'isTrue', ->
    r = caro.isTrue(true, 'true', 1);
    r2 = caro.isTrue(false);
    r.should.be.true
    r2.should.be.false

  it 'isFalse', ->
    r = caro.isFalse(false, 'false', 0);
    r2 = caro.isFalse(false, true);
    r.should.be.true
    r2.should.be.false

  it 'checkIfPassCb', ->
    r = caro.checkIfPassCb [1, 2, 3], (val) ->
      return val == 1;
    r2 = caro.checkIfPassCb [1, 2, 3], (val) ->
      return val == 1;
    , false
    r.should.be.false
    r2.should.be.true

  it 'executeIfFn', ->
    arg = (i) ->
      ++i
    r = caro.executeIfFn(arg, 12)
    r2 = caro.executeIfFn(null)
    r.should.eq 13
    should.equal r2, undefined

  it 'getFnName', ->
    arg = (i)->
      ++i
    r = caro.getFnName(arg)
    r.should.be.a('string')

  it 'formatMoney', ->
    arg = null;
    arg2 = '12003000.923';
    arg3 = 12003000.923;
    r = caro.formatMoney(arg);
    r2 = caro.formatMoney(arg2, 'int');
    r3 = caro.formatMoney(arg3, 'sInt');
    r4 = caro.formatMoney(arg3, {
      float: 0, separated: ',',
      decimal: '.', prefix: '',
      forceFloat: false
    });
    r5 = caro.formatMoney(arg3, {
      float: 5, forceFloat: true
    });
    r.should.eq '0'
    r2.should.eq '12,003,000'
    r3.should.eq '$12,003,000'
    r4.should.eq '12,003,000'
    r5.should.eq '12,003,000.92300'

  it 'coverToArr', ->
    r = caro.coverToArr('3')
    r2 = caro.coverToArr([1])
    r.should.eql(['3'])
    r2.should.eql([1])

  it 'coverToStr', ->
    r = caro.coverToStr('3')
    r2 = caro.coverToStr(['caro', 4])
    r3 = caro.coverToStr(undefined)
    r.should.eq('3')
    r2.should.eq('caro,4')
    r3.should.eq('undefined')

  it 'coverToInt', ->
    r = caro.coverToInt('3')
    r2 = caro.coverToInt('caro')
    r3 = caro.coverToInt(null, false)
    r.should.eq(3)
    r2.should.eq(0)
    should.equal(r3, null);

  it 'coverToNum', ->
    r = caro.coverToNum('3.4')
    r2 = caro.coverToNum('caro')
    r3 = caro.coverToNum('caro', false)
    r.should.eq(3.4)
    r2.should.eq(0)
    r3.should.eq('caro')

  it 'coverToFixed', ->
    r = caro.coverToFixed('3.4355', 2)
    r2 = caro.coverToFixed(undefined, 3)
    r3 = caro.coverToFixed('caro', 3, false)
    r.should.eq(3.44)
    r2.should.eq(0)
    r3.should.eq('caro')

  it 'coverToObj', ->
    r = caro.coverToObj('3.4')
    r2 = caro.coverToObj('{"a":3}')
    r3 = caro.coverToObj('caro', false)
    r.should.eql({})
    r2.should.eql({a: 3})
    r3.should.eq('caro')

  it 'coverToJson', ->
    r = caro.coverToJson(3.4)
    r2 = caro.coverToJson({
      a: 3
      b: 5
    }, {
      replacer: (key, val) ->
        return val if (key == '')
        return val + 1
      space: 0
      force: false
    })
    r3 = caro.coverToJson(undefined, {
      force: false
    })
    r.should.eq('3.4')
    r2.should.eq('{"a":4,"b":6}')
    should.equal(r3, undefined)