(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func (param i32 i32 i32 i32)))
  (type (;5;) (func (param i32 i32)))
  (import "env" "abort" (func $~lib/builtins/abort (type 4)))
  (import "conversion" "typeConversion.stringToH160" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160 (type 1)))
  (import "numbers" "bigDecimal.fromString" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString (type 1)))
  (import "numbers" "bigDecimal.minus" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.minus (type 0)))
  (import "numbers" "bigDecimal.dividedBy" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.dividedBy (type 0)))
  (import "index" "_registerTest" (func $~lib/matchstick-as/index/_registerTest (type 3)))
  (func $~lib/rt/stub/__alloc (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const 1073741820
    i32.gt_u
    if  ;; label = @1
      i32.const 1056
      i32.const 1120
      i32.const 33
      i32.const 29
      call $~lib/builtins/abort
      unreachable
    end
    global.get $~lib/rt/stub/offset
    local.tee 3
    i32.const 4
    i32.add
    local.tee 4
    local.get 0
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    i32.const 4
    i32.sub
    local.tee 5
    i32.add
    local.tee 1
    memory.size
    local.tee 2
    i32.const 16
    i32.shl
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee 0
    i32.gt_u
    if  ;; label = @1
      local.get 2
      local.get 1
      local.get 0
      i32.sub
      i32.const 65535
      i32.add
      i32.const -65536
      i32.and
      i32.const 16
      i32.shr_u
      local.tee 0
      local.get 0
      local.get 2
      i32.lt_s
      select
      memory.grow
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        local.get 0
        memory.grow
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          unreachable
        end
      end
    end
    local.get 1
    global.set $~lib/rt/stub/offset
    local.get 3
    local.get 5
    i32.store
    local.get 4)
  (func $~lib/rt/stub/__new (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 1073741804
    i32.gt_u
    if  ;; label = @1
      i32.const 1056
      i32.const 1120
      i32.const 86
      i32.const 30
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.const 16
    i32.add
    call $~lib/rt/stub/__alloc
    local.tee 3
    i32.const 4
    i32.sub
    local.tee 2
    i32.const 0
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=16
    local.get 3
    i32.const 16
    i32.add)
  (func $~lib/memory/memory.fill (type 5) (param i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8
      local.get 0
      local.get 1
      i32.add
      local.tee 2
      i32.const 1
      i32.sub
      i32.const 0
      i32.store8
      local.get 1
      i32.const 2
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8 offset=1
      local.get 0
      i32.const 0
      i32.store8 offset=2
      local.get 2
      i32.const 2
      i32.sub
      i32.const 0
      i32.store8
      local.get 2
      i32.const 3
      i32.sub
      i32.const 0
      i32.store8
      local.get 1
      i32.const 6
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8 offset=3
      local.get 2
      i32.const 4
      i32.sub
      i32.const 0
      i32.store8
      local.get 1
      i32.const 8
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 2
      i32.add
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i32.const -4
      i32.and
      local.tee 2
      i32.add
      local.tee 1
      i32.const 4
      i32.sub
      i32.const 0
      i32.store
      local.get 2
      i32.const 8
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 12
      i32.sub
      i32.const 0
      i32.store
      local.get 1
      i32.const 8
      i32.sub
      i32.const 0
      i32.store
      local.get 2
      i32.const 24
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store offset=12
      local.get 0
      i32.const 0
      i32.store offset=16
      local.get 0
      i32.const 0
      i32.store offset=20
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 1
      i32.const 28
      i32.sub
      i32.const 0
      i32.store
      local.get 1
      i32.const 24
      i32.sub
      i32.const 0
      i32.store
      local.get 1
      i32.const 20
      i32.sub
      i32.const 0
      i32.store
      local.get 1
      i32.const 16
      i32.sub
      i32.const 0
      i32.store
      local.get 0
      local.get 0
      i32.const 4
      i32.and
      i32.const 24
      i32.add
      local.tee 1
      i32.add
      local.set 0
      local.get 2
      local.get 1
      i32.sub
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 32
        i32.ge_u
        if  ;; label = @3
          local.get 0
          i64.const 0
          i64.store
          local.get 0
          i64.const 0
          i64.store offset=8
          local.get 0
          i64.const 0
          i64.store offset=16
          local.get 0
          i64.const 0
          i64.store offset=24
          local.get 1
          i32.const 32
          i32.sub
          local.set 1
          local.get 0
          i32.const 32
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
    end)
  (func $~lib/typedarray/Uint8Array#__set (type 3) (param i32 i32 i32)
    local.get 1
    local.get 0
    i32.load offset=8
    i32.ge_u
    if  ;; label = @1
      i32.const 2080
      i32.const 2144
      i32.const 175
      i32.const 45
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=4
    i32.add
    local.get 2
    i32.store8)
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32 (type 1) (param i32) (result i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        i32.const 12
        i32.const 12
        call $~lib/rt/stub/__new
        local.tee 1
        i32.eqz
        if  ;; label = @3
          i32.const 12
          i32.const 13
          call $~lib/rt/stub/__new
          local.set 1
        end
        local.get 1
      end
      i32.eqz
      if  ;; label = @2
        i32.const 12
        i32.const 2
        call $~lib/rt/stub/__new
        local.set 1
      end
      local.get 1
    end
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    i32.const 0
    i32.store offset=8
    i32.const 4
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    call $~lib/memory/memory.fill
    local.get 1
    local.get 2
    i32.store
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.store offset=8
    local.get 1
    i32.const 0
    local.get 0
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 1
    local.get 0
    i32.const 8
    i32.shr_s
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 2
    local.get 0
    i32.const 16
    i32.shr_s
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 3
    local.get 0
    i32.const 24
    i32.shr_s
    call $~lib/typedarray/Uint8Array#__set
    local.get 1)
  (func $~lib/typedarray/Uint8Array#__get (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=8
    i32.ge_u
    if  ;; label = @1
      i32.const 2080
      i32.const 2144
      i32.const 164
      i32.const 45
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=4
    i32.add
    i32.load8_u)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.compare (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=8
    i32.const 0
    i32.gt_s
    local.tee 2
    if (result i32)  ;; label = @1
      local.get 0
      local.get 0
      i32.load offset=8
      i32.const 1
      i32.sub
      call $~lib/typedarray/Uint8Array#__get
      i32.const 7
      i32.shr_u
      i32.const 1
      i32.eq
    else
      local.get 2
    end
    local.set 3
    i32.const 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.const 0
      i32.gt_s
      local.tee 2
      if  ;; label = @2
        local.get 1
        local.get 1
        i32.load offset=8
        i32.const 1
        i32.sub
        call $~lib/typedarray/Uint8Array#__get
        i32.const 7
        i32.shr_u
        i32.const 1
        i32.eq
        local.set 2
      end
      local.get 2
    end
    local.get 3
    select
    if  ;; label = @1
      i32.const 1
      return
    end
    local.get 2
    i32.const 1
    local.get 3
    select
    i32.eqz
    if  ;; label = @1
      i32.const -1
      return
    end
    local.get 0
    i32.load offset=8
    local.set 5
    loop  ;; label = @1
      local.get 5
      i32.const 0
      i32.gt_s
      if (result i32)  ;; label = @2
        local.get 3
        if (result i32)  ;; label = @3
          i32.const 1
        else
          local.get 0
          local.get 5
          i32.const 1
          i32.sub
          call $~lib/typedarray/Uint8Array#__get
        end
        if (result i32)  ;; label = @3
          local.get 3
          if (result i32)  ;; label = @4
            local.get 0
            local.get 5
            i32.const 1
            i32.sub
            call $~lib/typedarray/Uint8Array#__get
            i32.const 255
            i32.eq
          else
            i32.const 0
          end
        else
          i32.const 1
        end
      else
        i32.const 0
      end
      if  ;; label = @2
        local.get 5
        i32.const 1
        i32.sub
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 1
    i32.load offset=8
    local.set 4
    loop  ;; label = @1
      local.get 4
      i32.const 0
      i32.gt_s
      if (result i32)  ;; label = @2
        local.get 2
        if (result i32)  ;; label = @3
          i32.const 1
        else
          local.get 1
          local.get 4
          i32.const 1
          i32.sub
          call $~lib/typedarray/Uint8Array#__get
        end
        if (result i32)  ;; label = @3
          local.get 2
          if (result i32)  ;; label = @4
            local.get 1
            local.get 4
            i32.const 1
            i32.sub
            call $~lib/typedarray/Uint8Array#__get
            i32.const 255
            i32.eq
          else
            i32.const 0
          end
        else
          i32.const 1
        end
      else
        i32.const 0
      end
      if  ;; label = @2
        local.get 4
        i32.const 1
        i32.sub
        local.set 4
        br 1 (;@1;)
      end
    end
    local.get 4
    local.get 5
    i32.lt_s
    if  ;; label = @1
      i32.const -1
      i32.const 1
      local.get 3
      select
      return
    end
    local.get 4
    local.get 5
    i32.gt_s
    if  ;; label = @1
      i32.const 1
      i32.const -1
      local.get 3
      select
      return
    end
    i32.const 1
    local.set 2
    loop  ;; label = @1
      local.get 2
      local.get 5
      i32.le_s
      if  ;; label = @2
        local.get 0
        local.get 5
        local.get 2
        i32.sub
        local.tee 3
        call $~lib/typedarray/Uint8Array#__get
        local.get 1
        local.get 3
        call $~lib/typedarray/Uint8Array#__get
        i32.lt_u
        if  ;; label = @3
          i32.const -1
          return
        end
        local.get 0
        local.get 5
        local.get 2
        i32.sub
        local.tee 3
        call $~lib/typedarray/Uint8Array#__get
        local.get 1
        local.get 3
        call $~lib/typedarray/Uint8Array#__get
        i32.gt_u
        if  ;; label = @3
          i32.const 1
          return
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    i32.const 0)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#equals (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 2800
      i32.const 2960
      i32.const 379
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.minus
    local.tee 0
    i32.load
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.compare
    if (result i32)  ;; label = @1
      i32.const 1
      i32.const -1
      local.get 0
      i32.load
      i32.const 0
      call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.compare
      i32.const 1
      i32.eq
      select
    else
      i32.const 0
    end
    i32.eqz)
  (func $src/utils/math/safeDiv (type 0) (param i32 i32) (result i32)
    local.get 1
    global.get $src/utils/constants/ZERO_BIG_DECIMAL
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#equals
    if  ;; label = @1
      global.get $src/utils/constants/ZERO_BIG_DECIMAL
      return
    end
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 3072
      i32.const 2960
      i32.const 391
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.dividedBy)
  (func $start:tests/utils/math.test~anonymous|0 (type 2)
    i32.const 2768
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    call $src/utils/math/safeDiv
    global.get $src/utils/constants/ZERO_BIG_DECIMAL
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#equals
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 3216
      i32.const 12
      i32.const 3
      call $~lib/builtins/abort
      unreachable
    end)
  (func $start:tests/utils/math.test~anonymous|1 (type 2)
    i32.const 3536
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    i32.const 3568
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    call $src/utils/math/safeDiv
    i32.const 3600
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#equals
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 3216
      i32.const 21
      i32.const 3
      call $~lib/builtins/abort
      unreachable
    end)
  (func $node_modules/@graphprotocol/graph-ts/global/global/id_of_type (type 1) (param i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      block  ;; label = @42
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  block  ;; label = @48
                                                                                                    block  ;; label = @49
                                                                                                      block  ;; label = @50
                                                                                                        block  ;; label = @51
                                                                                                          block  ;; label = @52
                                                                                                            block  ;; label = @53
                                                                                                              block  ;; label = @54
                                                                                                                block  ;; label = @55
                                                                                                                  block  ;; label = @56
                                                                                                                    block  ;; label = @57
                                                                                                                      block  ;; label = @58
                                                                                                                        block  ;; label = @59
                                                                                                                          block  ;; label = @60
                                                                                                                            block  ;; label = @61
                                                                                                                              block  ;; label = @62
                                                                                                                                block  ;; label = @63
                                                                                                                                  block  ;; label = @64
                                                                                                                                    block  ;; label = @65
                                                                                                                                      block  ;; label = @66
                                                                                                                                        block  ;; label = @67
                                                                                                                                          block  ;; label = @68
                                                                                                                                            block  ;; label = @69
                                                                                                                                              block  ;; label = @70
                                                                                                                                                block  ;; label = @71
                                                                                                                                                  block  ;; label = @72
                                                                                                                                                    block  ;; label = @73
                                                                                                                                                      block  ;; label = @74
                                                                                                                                                        block  ;; label = @75
                                                                                                                                                          block  ;; label = @76
                                                                                                                                                            block  ;; label = @77
                                                                                                                                                              block  ;; label = @78
                                                                                                                                                                block  ;; label = @79
                                                                                                                                                                  block  ;; label = @80
                                                                                                                                                                    block  ;; label = @81
                                                                                                                                                                      block  ;; label = @82
                                                                                                                                                                        block  ;; label = @83
                                                                                                                                                                          block  ;; label = @84
                                                                                                                                                                            block  ;; label = @85
                                                                                                                                                                              block  ;; label = @86
                                                                                                                                                                                block  ;; label = @87
                                                                                                                                                                                  block  ;; label = @88
                                                                                                                                                                                    block  ;; label = @89
                                                                                                                                                                                      block  ;; label = @90
                                                                                                                                                                                        block  ;; label = @91
                                                                                                                                                                                          block  ;; label = @92
                                                                                                                                                                                            block  ;; label = @93
                                                                                                                                                                                              block  ;; label = @94
                                                                                                                                                                                                block  ;; label = @95
                                                                                                                                                                                                  block  ;; label = @96
                                                                                                                                                                                                    block  ;; label = @97
                                                                                                                                                                                                      block  ;; label = @98
                                                                                                                                                                                                        block  ;; label = @99
                                                                                                                                                                                                          block  ;; label = @100
                                                                                                                                                                                                            block  ;; label = @101
                                                                                                                                                                                                              block  ;; label = @102
                                                                                                                                                                                                                block  ;; label = @103
                                                                                                                                                                                                                  block  ;; label = @104
                                                                                                                                                                                                                    block  ;; label = @105
                                                                                                                                                                                                                      block  ;; label = @106
                                                                                                                                                                                                                        block  ;; label = @107
                                                                                                                                                                                                                          block  ;; label = @108
                                                                                                                                                                                                                            block  ;; label = @109
                                                                                                                                                                                                                              block  ;; label = @110
                                                                                                                                                                                                                                block  ;; label = @111
                                                                                                                                                                                                                                  block  ;; label = @112
                                                                                                                                                                                                                                    block  ;; label = @113
                                                                                                                                                                                                                                      block  ;; label = @114
                                                                                                                                                                                                                                        block  ;; label = @115
                                                                                                                                                                                                                                          block  ;; label = @116
                                                                                                                                                                                                                                            block  ;; label = @117
                                                                                                                                                                                                                                              block  ;; label = @118
                                                                                                                                                                                                                                                block  ;; label = @119
                                                                                                                                                                                                                                                  block  ;; label = @120
                                                                                                                                                                                                                                                    block  ;; label = @121
                                                                                                                                                                                                                                                      block  ;; label = @122
                                                                                                                                                                                                                                                        block  ;; label = @123
                                                                                                                                                                                                                                                          block  ;; label = @124
                                                                                                                                                                                                                                                            block  ;; label = @125
                                                                                                                                                                                                                                                              block  ;; label = @126
                                                                                                                                                                                                                                                                block  ;; label = @127
                                                                                                                                                                                                                                                                  block  ;; label = @128
                                                                                                                                                                                                                                                                    block  ;; label = @129
                                                                                                                                                                                                                                                                      block  ;; label = @130
                                                                                                                                                                                                                                                                        block  ;; label = @131
                                                                                                                                                                                                                                                                          block  ;; label = @132
                                                                                                                                                                                                                                                                            block  ;; label = @133
                                                                                                                                                                                                                                                                              block  ;; label = @134
                                                                                                                                                                                                                                                                                block  ;; label = @135
                                                                                                                                                                                                                                                                                  block  ;; label = @136
                                                                                                                                                                                                                                                                                    block  ;; label = @137
                                                                                                                                                                                                                                                                                      block  ;; label = @138
                                                                                                                                                                                                                                                                                        block  ;; label = @139
                                                                                                                                                                                                                                                                                          block  ;; label = @140
                                                                                                                                                                                                                                                                                            block  ;; label = @141
                                                                                                                                                                                                                                                                                              block  ;; label = @142
                                                                                                                                                                                                                                                                                                block  ;; label = @143
                                                                                                                                                                                                                                                                                                  block  ;; label = @144
                                                                                                                                                                                                                                                                                                    block  ;; label = @145
                                                                                                                                                                                                                                                                                                      block  ;; label = @146
                                                                                                                                                                                                                                                                                                        block  ;; label = @147
                                                                                                                                                                                                                                                                                                          block  ;; label = @148
                                                                                                                                                                                                                                                                                                            block  ;; label = @149
                                                                                                                                                                                                                                                                                                              block  ;; label = @150
                                                                                                                                                                                                                                                                                                                block  ;; label = @151
                                                                                                                                                                                                                                                                                                                  block  ;; label = @152
                                                                                                                                                                                                                                                                                                                    block  ;; label = @153
                                                                                                                                                                                                                                                                                                                      block  ;; label = @154
                                                                                                                                                                                                                                                                                                                        block  ;; label = @155
                                                                                                                                                                                                                                                                                                                          block  ;; label = @156
                                                                                                                                                                                                                                                                                                                            block  ;; label = @157
                                                                                                                                                                                                                                                                                                                              block  ;; label = @158
                                                                                                                                                                                                                                                                                                                                block  ;; label = @159
                                                                                                                                                                                                                                                                                                                                  block  ;; label = @160
                                                                                                                                                                                                                                                                                                                                    block  ;; label = @161
                                                                                                                                                                                                                                                                                                                                      block  ;; label = @162
                                                                                                                                                                                                                                                                                                                                        block  ;; label = @163
                                                                                                                                                                                                                                                                                                                                          block  ;; label = @164
                                                                                                                                                                                                                                                                                                                                            block  ;; label = @165
                                                                                                                                                                                                                                                                                                                                              block  ;; label = @166
                                                                                                                                                                                                                                                                                                                                                local.get 0
                                                                                                                                                                                                                                                                                                                                                if  ;; label = @167
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 1 (;@166;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 2 (;@165;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 3 (;@164;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 4
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 4 (;@163;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 5
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 5 (;@162;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 6
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 6 (;@161;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 7
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 7 (;@160;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 8
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 8 (;@159;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 9
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 9 (;@158;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 10
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 10 (;@157;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 11
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 11 (;@156;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 12
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 12 (;@155;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 13
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 13 (;@154;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 14
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 14 (;@153;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 15
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 15 (;@152;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 16
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 16 (;@151;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 17
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 17 (;@150;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 18
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 18 (;@149;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 19
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 19 (;@148;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 20
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 20 (;@147;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 21
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 21 (;@146;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 27
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 22 (;@145;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 28
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 23 (;@144;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 29
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 24 (;@143;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 22
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 25 (;@142;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 23
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 26 (;@141;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 24
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 27 (;@140;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 25
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 28 (;@139;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 26
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 29 (;@138;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 30
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 30 (;@137;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 31
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 31 (;@136;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 32
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 32 (;@135;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 33
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 33 (;@134;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 34
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 34 (;@133;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 35
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 35 (;@132;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 36
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 36 (;@131;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 37
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 37 (;@130;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 38
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 38 (;@129;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 39
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 39 (;@128;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 40
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 40 (;@127;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 41
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 41 (;@126;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 42
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 42 (;@125;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 43
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 43 (;@124;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 44
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 44 (;@123;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 45
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 45 (;@122;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 46
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 46 (;@121;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 47
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 47 (;@120;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 48
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 48 (;@119;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 49
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 49 (;@118;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 50
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 50 (;@117;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 51
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 51 (;@116;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 52
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 52 (;@115;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 53
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 53 (;@114;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 54
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 54 (;@113;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 55
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 55 (;@112;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 56
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 56 (;@111;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 57
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 57 (;@110;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 58
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 58 (;@109;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 59
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 59 (;@108;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 60
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 60 (;@107;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 61
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 61 (;@106;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 63
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 62 (;@105;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 64
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 63 (;@104;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 65
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 64 (;@103;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 66
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 65 (;@102;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 67
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 66 (;@101;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 68
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 67 (;@100;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 69
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 68 (;@99;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 70
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 69 (;@98;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 71
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 70 (;@97;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 72
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 71 (;@96;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 73
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 72 (;@95;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 74
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 73 (;@94;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 75
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 74 (;@93;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 76
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 75 (;@92;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 77
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 76 (;@91;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 78
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 77 (;@90;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 79
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 78 (;@89;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 80
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 79 (;@88;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 81
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 80 (;@87;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 82
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 81 (;@86;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 83
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 82 (;@85;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 84
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 83 (;@84;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 85
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 84 (;@83;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 86
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 85 (;@82;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1000
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 86 (;@81;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1001
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 87 (;@80;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1002
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 88 (;@79;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1003
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 89 (;@78;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1500
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 90 (;@77;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1501
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 91 (;@76;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1502
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 92 (;@75;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1503
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 93 (;@74;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1504
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 94 (;@73;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1505
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 95 (;@72;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1506
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 96 (;@71;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1507
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 97 (;@70;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1508
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 98 (;@69;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1509
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 99 (;@68;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1510
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 100 (;@67;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1511
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 101 (;@66;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1512
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 102 (;@65;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1513
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 103 (;@64;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1514
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 104 (;@63;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1515
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 105 (;@62;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1516
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 106 (;@61;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1517
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 107 (;@60;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1518
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 108 (;@59;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1519
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 109 (;@58;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1520
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 110 (;@57;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1521
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 111 (;@56;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1522
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 112 (;@55;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1523
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 113 (;@54;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1524
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 114 (;@53;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1525
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 115 (;@52;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1526
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 116 (;@51;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1527
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 117 (;@50;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1528
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 118 (;@49;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1529
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 119 (;@48;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1530
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 120 (;@47;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1531
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 121 (;@46;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1532
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 122 (;@45;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1533
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 123 (;@44;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1534
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 124 (;@43;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1535
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 125 (;@42;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1536
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 126 (;@41;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1537
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 127 (;@40;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1538
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 128 (;@39;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1539
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 129 (;@38;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1540
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 130 (;@37;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1541
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 131 (;@36;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1542
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 132 (;@35;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1543
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 133 (;@34;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1544
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 134 (;@33;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1545
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 135 (;@32;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1546
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 136 (;@31;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1547
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 137 (;@30;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1548
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 138 (;@29;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1549
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 139 (;@28;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1550
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 140 (;@27;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1551
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 141 (;@26;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1552
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 142 (;@25;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1553
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 143 (;@24;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1554
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 144 (;@23;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1555
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 145 (;@22;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1556
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 146 (;@21;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1557
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 147 (;@20;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1558
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 148 (;@19;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1559
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 149 (;@18;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1560
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 150 (;@17;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1561
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 151 (;@16;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1562
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 152 (;@15;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1563
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 153 (;@14;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2500
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 154 (;@13;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2501
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 155 (;@12;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2502
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 156 (;@11;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2503
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 157 (;@10;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2504
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 158 (;@9;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2505
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 159 (;@8;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2506
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 160 (;@7;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3500
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 161 (;@6;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3501
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 162 (;@5;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3502
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 163 (;@4;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3503
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 164 (;@3;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3504
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 165 (;@2;)
                                                                                                                                                                                                                                                                                                                                                  br 166 (;@1;)
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                i32.const 1
                                                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                              i32.const 0
                                                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                            i32.const 17
                                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                          i32.const 18
                                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        i32.const 19
                                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                      i32.const 20
                                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                    i32.const 13
                                                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                  i32.const 21
                                                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                i32.const 22
                                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                              i32.const 23
                                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                            i32.const 24
                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                          i32.const 25
                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                        i32.const 26
                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                      i32.const 28
                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                    i32.const 29
                                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                  i32.const 31
                                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                i32.const 33
                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                              i32.const 35
                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                            i32.const 3
                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                          i32.const 37
                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                        i32.const 39
                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                      i32.const 44
                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                    i32.const 45
                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                  i32.const 46
                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                i32.const 47
                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                              i32.const 48
                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                            i32.const 36
                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                          i32.const 52
                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                        i32.const 53
                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                      i32.const 54
                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                    i32.const 30
                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                  i32.const 32
                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                i32.const 34
                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                              i32.const 55
                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                            i32.const 40
                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                          i32.const 60
                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                        i32.const 41
                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                      i32.const 60
                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                    i32.const 61
                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                  i32.const 64
                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                i32.const 66
                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                              i32.const 67
                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                            i32.const 68
                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                          i32.const 69
                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                        i32.const 70
                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                      i32.const 71
                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                    i32.const 72
                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                  i32.const 73
                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                i32.const 74
                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                              i32.const 75
                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                            i32.const 76
                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                          i32.const 77
                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                        i32.const 79
                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                      i32.const 58
                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                    i32.const 81
                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                  i32.const 82
                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                i32.const 87
                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                              i32.const 89
                                                                                                                                                                                                                              return
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                            i32.const 91
                                                                                                                                                                                                                            return
                                                                                                                                                                                                                          end
                                                                                                                                                                                                                          i32.const 93
                                                                                                                                                                                                                          return
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                        i32.const 94
                                                                                                                                                                                                                        return
                                                                                                                                                                                                                      end
                                                                                                                                                                                                                      i32.const 80
                                                                                                                                                                                                                      return
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                    i32.const 86
                                                                                                                                                                                                                    return
                                                                                                                                                                                                                  end
                                                                                                                                                                                                                  i32.const 90
                                                                                                                                                                                                                  return
                                                                                                                                                                                                                end
                                                                                                                                                                                                                i32.const 95
                                                                                                                                                                                                                return
                                                                                                                                                                                                              end
                                                                                                                                                                                                              i32.const 96
                                                                                                                                                                                                              return
                                                                                                                                                                                                            end
                                                                                                                                                                                                            i32.const 94
                                                                                                                                                                                                            return
                                                                                                                                                                                                          end
                                                                                                                                                                                                          i32.const 78
                                                                                                                                                                                                          return
                                                                                                                                                                                                        end
                                                                                                                                                                                                        i32.const 97
                                                                                                                                                                                                        return
                                                                                                                                                                                                      end
                                                                                                                                                                                                      i32.const 98
                                                                                                                                                                                                      return
                                                                                                                                                                                                    end
                                                                                                                                                                                                    i32.const 99
                                                                                                                                                                                                    return
                                                                                                                                                                                                  end
                                                                                                                                                                                                  i32.const 100
                                                                                                                                                                                                  return
                                                                                                                                                                                                end
                                                                                                                                                                                                i32.const 101
                                                                                                                                                                                                return
                                                                                                                                                                                              end
                                                                                                                                                                                              i32.const 102
                                                                                                                                                                                              return
                                                                                                                                                                                            end
                                                                                                                                                                                            i32.const 104
                                                                                                                                                                                            return
                                                                                                                                                                                          end
                                                                                                                                                                                          i32.const 105
                                                                                                                                                                                          return
                                                                                                                                                                                        end
                                                                                                                                                                                        i32.const 106
                                                                                                                                                                                        return
                                                                                                                                                                                      end
                                                                                                                                                                                      i32.const 107
                                                                                                                                                                                      return
                                                                                                                                                                                    end
                                                                                                                                                                                    i32.const 83
                                                                                                                                                                                    return
                                                                                                                                                                                  end
                                                                                                                                                                                  i32.const 108
                                                                                                                                                                                  return
                                                                                                                                                                                end
                                                                                                                                                                                i32.const 88
                                                                                                                                                                                return
                                                                                                                                                                              end
                                                                                                                                                                              i32.const 109
                                                                                                                                                                              return
                                                                                                                                                                            end
                                                                                                                                                                            i32.const 85
                                                                                                                                                                            return
                                                                                                                                                                          end
                                                                                                                                                                          i32.const 92
                                                                                                                                                                          return
                                                                                                                                                                        end
                                                                                                                                                                        i32.const 110
                                                                                                                                                                        return
                                                                                                                                                                      end
                                                                                                                                                                      i32.const 111
                                                                                                                                                                      return
                                                                                                                                                                    end
                                                                                                                                                                    i32.const 56
                                                                                                                                                                    return
                                                                                                                                                                  end
                                                                                                                                                                  i32.const 57
                                                                                                                                                                  return
                                                                                                                                                                end
                                                                                                                                                                i32.const 29
                                                                                                                                                                return
                                                                                                                                                              end
                                                                                                                                                              i32.const 59
                                                                                                                                                              return
                                                                                                                                                            end
                                                                                                                                                            i32.const 112
                                                                                                                                                            return
                                                                                                                                                          end
                                                                                                                                                          i32.const 113
                                                                                                                                                          return
                                                                                                                                                        end
                                                                                                                                                        i32.const 58
                                                                                                                                                        return
                                                                                                                                                      end
                                                                                                                                                      i32.const 115
                                                                                                                                                      return
                                                                                                                                                    end
                                                                                                                                                    i32.const 118
                                                                                                                                                    return
                                                                                                                                                  end
                                                                                                                                                  i32.const 122
                                                                                                                                                  return
                                                                                                                                                end
                                                                                                                                                i32.const 121
                                                                                                                                                return
                                                                                                                                              end
                                                                                                                                              i32.const 138
                                                                                                                                              return
                                                                                                                                            end
                                                                                                                                            i32.const 143
                                                                                                                                            return
                                                                                                                                          end
                                                                                                                                          i32.const 145
                                                                                                                                          return
                                                                                                                                        end
                                                                                                                                        i32.const 153
                                                                                                                                        return
                                                                                                                                      end
                                                                                                                                      i32.const 137
                                                                                                                                      return
                                                                                                                                    end
                                                                                                                                    i32.const 155
                                                                                                                                    return
                                                                                                                                  end
                                                                                                                                  i32.const 149
                                                                                                                                  return
                                                                                                                                end
                                                                                                                                i32.const 156
                                                                                                                                return
                                                                                                                              end
                                                                                                                              i32.const 126
                                                                                                                              return
                                                                                                                            end
                                                                                                                            i32.const 73
                                                                                                                            return
                                                                                                                          end
                                                                                                                          i32.const 161
                                                                                                                          return
                                                                                                                        end
                                                                                                                        i32.const 114
                                                                                                                        return
                                                                                                                      end
                                                                                                                      i32.const 133
                                                                                                                      return
                                                                                                                    end
                                                                                                                    i32.const 116
                                                                                                                    return
                                                                                                                  end
                                                                                                                  i32.const 142
                                                                                                                  return
                                                                                                                end
                                                                                                                i32.const 132
                                                                                                                return
                                                                                                              end
                                                                                                              i32.const 160
                                                                                                              return
                                                                                                            end
                                                                                                            i32.const 124
                                                                                                            return
                                                                                                          end
                                                                                                          i32.const 163
                                                                                                          return
                                                                                                        end
                                                                                                        i32.const 119
                                                                                                        return
                                                                                                      end
                                                                                                      i32.const 120
                                                                                                      return
                                                                                                    end
                                                                                                    i32.const 166
                                                                                                    return
                                                                                                  end
                                                                                                  i32.const 125
                                                                                                  return
                                                                                                end
                                                                                                i32.const 123
                                                                                                return
                                                                                              end
                                                                                              i32.const 157
                                                                                              return
                                                                                            end
                                                                                            i32.const 162
                                                                                            return
                                                                                          end
                                                                                          i32.const 150
                                                                                          return
                                                                                        end
                                                                                        i32.const 131
                                                                                        return
                                                                                      end
                                                                                      i32.const 167
                                                                                      return
                                                                                    end
                                                                                    i32.const 129
                                                                                    return
                                                                                  end
                                                                                  i32.const 128
                                                                                  return
                                                                                end
                                                                                i32.const 139
                                                                                return
                                                                              end
                                                                              i32.const 141
                                                                              return
                                                                            end
                                                                            i32.const 140
                                                                            return
                                                                          end
                                                                          i32.const 127
                                                                          return
                                                                        end
                                                                        i32.const 136
                                                                        return
                                                                      end
                                                                      i32.const 158
                                                                      return
                                                                    end
                                                                    i32.const 152
                                                                    return
                                                                  end
                                                                  i32.const 159
                                                                  return
                                                                end
                                                                i32.const 73
                                                                return
                                                              end
                                                              i32.const 130
                                                              return
                                                            end
                                                            i32.const 73
                                                            return
                                                          end
                                                          i32.const 144
                                                          return
                                                        end
                                                        i32.const 117
                                                        return
                                                      end
                                                      i32.const 151
                                                      return
                                                    end
                                                    i32.const 169
                                                    return
                                                  end
                                                  i32.const 147
                                                  return
                                                end
                                                i32.const 148
                                                return
                                              end
                                              i32.const 146
                                              return
                                            end
                                            i32.const 135
                                            return
                                          end
                                          i32.const 164
                                          return
                                        end
                                        i32.const 134
                                        return
                                      end
                                      i32.const 170
                                      return
                                    end
                                    i32.const 154
                                    return
                                  end
                                  i32.const 165
                                  return
                                end
                                i32.const 171
                                return
                              end
                              i32.const 168
                              return
                            end
                            i32.const 172
                            return
                          end
                          i32.const 175
                          return
                        end
                        i32.const 173
                        return
                      end
                      i32.const 174
                      return
                    end
                    i32.const 176
                    return
                  end
                  i32.const 177
                  return
                end
                i32.const 178
                return
              end
              i32.const 179
              return
            end
            i32.const 180
            return
          end
          i32.const 73
          return
        end
        i32.const 181
        return
      end
      i32.const 58
      return
    end
    i32.const 0)
  (func $node_modules/@graphprotocol/graph-ts/global/global/allocate (type 1) (param i32) (result i32)
    local.get 0
    call $~lib/rt/stub/__alloc)
  (func $~start (type 2)
    (local i32 i32 i32)
    global.get $~started
    if  ;; label = @1
      return
    end
    i32.const 1
    global.set $~started
    i32.const 3756
    global.set $~lib/rt/stub/offset
    i32.const 0
    call $~lib/rt/stub/__alloc
    drop
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        i32.const 4
        i32.const 4
        call $~lib/rt/stub/__new
        local.tee 0
        i32.eqz
        if  ;; label = @3
          i32.const 4
          i32.const 5
          call $~lib/rt/stub/__new
          local.set 0
        end
        local.get 0
      end
      i32.eqz
      if  ;; label = @2
        i32.const 4
        i32.const 7
        call $~lib/rt/stub/__new
        local.set 0
      end
      local.get 0
    end
    i32.const 0
    i32.store
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    i32.const 0
    i32.store offset=8
    local.get 1
    i32.const 0
    i32.store offset=12
    i32.const 32
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 32
    call $~lib/memory/memory.fill
    local.get 1
    local.get 2
    i32.store
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 32
    i32.store offset=8
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.store
    i32.const 1904
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    drop
    i32.const 1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    drop
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    global.set $src/utils/constants/ZERO_BIG_DECIMAL
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    drop
    i32.const 2560
    i32.const 0
    i32.const 3296
    i32.load
    call $~lib/matchstick-as/index/_registerTest
    i32.const 3328
    i32.const 0
    i32.const 3632
    i32.load
    call $~lib/matchstick-as/index/_registerTest
    i32.const 0
    call $~lib/rt/stub/__alloc
    drop)
  (table $0 3 funcref)
  (memory (;0;) 1)
  (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
  (global $src/utils/constants/ZERO_BIG_DECIMAL (mut i32) (i32.const 0))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.String i32 (i32.const 0))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayBuffer i32 (i32.const 1))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int8Array i32 (i32.const 2))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int16Array i32 (i32.const 3))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int32Array i32 (i32.const 4))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int64Array i32 (i32.const 5))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint8Array i32 (i32.const 6))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint16Array i32 (i32.const 7))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint32Array i32 (i32.const 8))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint64Array i32 (i32.const 9))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Float32Array i32 (i32.const 10))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Float64Array i32 (i32.const 11))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.BigDecimal i32 (i32.const 12))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayBool i32 (i32.const 13))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayUint8Array i32 (i32.const 14))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayEthereumValue i32 (i32.const 15))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayStoreValue i32 (i32.const 16))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayJsonValue i32 (i32.const 17))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayString i32 (i32.const 18))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayEventParam i32 (i32.const 19))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayTypedMapEntryStringJsonValue i32 (i32.const 20))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayTypedMapEntryStringStoreValue i32 (i32.const 21))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.SmartContractCall i32 (i32.const 22))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EventParam i32 (i32.const 23))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumTransaction i32 (i32.const 24))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumBlock i32 (i32.const 25))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumCall i32 (i32.const 26))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.WrappedTypedMapStringJsonValue i32 (i32.const 27))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.WrappedBool i32 (i32.const 28))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.WrappedJsonValue i32 (i32.const 29))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumValue i32 (i32.const 30))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StoreValue i32 (i32.const 31))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.JsonValue i32 (i32.const 32))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumEvent i32 (i32.const 33))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapEntryStringStoreValue i32 (i32.const 34))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapEntryStringJsonValue i32 (i32.const 35))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapStringStoreValue i32 (i32.const 36))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapStringJsonValue i32 (i32.const 37))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapStringTypedMapStringJsonValue i32 (i32.const 38))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ResultTypedMapStringJsonValueBool i32 (i32.const 39))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ResultJsonValueBool i32 (i32.const 40))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU8 i32 (i32.const 41))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU16 i32 (i32.const 42))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU32 i32 (i32.const 43))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU64 i32 (i32.const 44))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI8 i32 (i32.const 45))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI16 i32 (i32.const 46))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI32 i32 (i32.const 47))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI64 i32 (i32.const 48))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayF32 i32 (i32.const 49))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayF64 i32 (i32.const 50))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayBigDecimal i32 (i32.const 51))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayDataReceiver i32 (i32.const 52))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayCryptoHash i32 (i32.const 53))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayActionValue i32 (i32.const 54))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearMerklePath i32 (i32.const 55))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayValidatorStake i32 (i32.const 56))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArraySlashedValidator i32 (i32.const 57))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArraySignature i32 (i32.const 58))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayChunkHeader i32 (i32.const 59))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearAccessKeyPermissionValue i32 (i32.const 60))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearActionValue i32 (i32.const 61))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDirection i32 (i32.const 62))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearPublicKey i32 (i32.const 63))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearSignature i32 (i32.const 64))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearFunctionCallPermission i32 (i32.const 65))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearFullAccessPermission i32 (i32.const 66))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearAccessKey i32 (i32.const 67))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDataReceiver i32 (i32.const 68))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearCreateAccountAction i32 (i32.const 69))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDeployContractAction i32 (i32.const 70))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearFunctionCallAction i32 (i32.const 71))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearTransferAction i32 (i32.const 72))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearStakeAction i32 (i32.const 73))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearAddKeyAction i32 (i32.const 74))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDeleteKeyAction i32 (i32.const 75))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDeleteAccountAction i32 (i32.const 76))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearActionReceipt i32 (i32.const 77))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearSuccessStatus i32 (i32.const 78))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearMerklePathItem i32 (i32.const 79))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearExecutionOutcome i32 (i32.const 80))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearSlashedValidator i32 (i32.const 81))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearBlockHeader i32 (i32.const 82))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearValidatorStake i32 (i32.const 83))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearChunkHeader i32 (i32.const 84))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearBlock i32 (i32.const 85))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearReceiptWithOutcome i32 (i32.const 86))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TransactionReceipt i32 (i32.const 1000))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Log i32 (i32.const 1001))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayH256 i32 (i32.const 1002))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayLog i32 (i32.const 1003))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosAny i32 (i32.const 1500))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosAnyArray i32 (i32.const 1501))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBytesArray i32 (i32.const 1502))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCoinArray i32 (i32.const 1503))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCommitSigArray i32 (i32.const 1504))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventArray i32 (i32.const 1505))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventAttributeArray i32 (i32.const 1506))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidenceArray i32 (i32.const 1507))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfoArray i32 (i32.const 1508))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignerInfoArray i32 (i32.const 1509))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTxResultArray i32 (i32.const 1510))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorArray i32 (i32.const 1511))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorUpdateArray i32 (i32.const 1512))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosAuthInfo i32 (i32.const 1513))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlock i32 (i32.const 1514))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlockId i32 (i32.const 1515))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlockIdFlagEnum i32 (i32.const 1516))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlockParams i32 (i32.const 1517))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCoin i32 (i32.const 1518))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCommit i32 (i32.const 1519))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCommitSig i32 (i32.const 1520))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCompactBitArray i32 (i32.const 1521))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosConsensus i32 (i32.const 1522))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosConsensusParams i32 (i32.const 1523))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosDuplicateVoteEvidence i32 (i32.const 1524))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosDuration i32 (i32.const 1525))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvent i32 (i32.const 1526))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventAttribute i32 (i32.const 1527))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventData i32 (i32.const 1528))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventVote i32 (i32.const 1529))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidence i32 (i32.const 1530))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidenceList i32 (i32.const 1531))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidenceParams i32 (i32.const 1532))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosFee i32 (i32.const 1533))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosHeader i32 (i32.const 1534))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosHeaderOnlyBlock i32 (i32.const 1535))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosLightBlock i32 (i32.const 1536))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosLightClientAttackEvidence i32 (i32.const 1537))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfo i32 (i32.const 1538))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfoMulti i32 (i32.const 1539))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfoSingle i32 (i32.const 1540))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosPartSetHeader i32 (i32.const 1541))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosPublicKey i32 (i32.const 1542))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosResponseBeginBlock i32 (i32.const 1543))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosResponseDeliverTx i32 (i32.const 1544))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosResponseEndBlock i32 (i32.const 1545))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignModeEnum i32 (i32.const 1546))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignedHeader i32 (i32.const 1547))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignedMsgTypeEnum i32 (i32.const 1548))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignerInfo i32 (i32.const 1549))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTimestamp i32 (i32.const 1550))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTip i32 (i32.const 1551))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTransactionData i32 (i32.const 1552))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTx i32 (i32.const 1553))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTxBody i32 (i32.const 1554))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTxResult i32 (i32.const 1555))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidator i32 (i32.const 1556))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorParams i32 (i32.const 1557))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorSet i32 (i32.const 1558))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorSetUpdates i32 (i32.const 1559))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorUpdate i32 (i32.const 1560))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosVersionParams i32 (i32.const 1561))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosMessageData i32 (i32.const 1562))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTransactionContext i32 (i32.const 1563))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveBlock i32 (i32.const 2500))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveProofOfAccess i32 (i32.const 2501))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTag i32 (i32.const 2502))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTagArray i32 (i32.const 2503))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTransaction i32 (i32.const 2504))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTransactionArray i32 (i32.const 2505))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTransactionWithBlockPtr i32 (i32.const 2506))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetBlock i32 (i32.const 3500))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetTransaction i32 (i32.const 3501))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetTransactionTypeEnum i32 (i32.const 3502))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetEvent i32 (i32.const 3503))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetArrayBytes i32 (i32.const 3504))
  (global $~started (mut i32) (i32.const 0))
  (export "TypeId.String" (global 2))
  (export "TypeId.ArrayBuffer" (global 3))
  (export "TypeId.Int8Array" (global 4))
  (export "TypeId.Int16Array" (global 5))
  (export "TypeId.Int32Array" (global 6))
  (export "TypeId.Int64Array" (global 7))
  (export "TypeId.Uint8Array" (global 8))
  (export "TypeId.Uint16Array" (global 9))
  (export "TypeId.Uint32Array" (global 10))
  (export "TypeId.Uint64Array" (global 11))
  (export "TypeId.Float32Array" (global 12))
  (export "TypeId.Float64Array" (global 13))
  (export "TypeId.BigDecimal" (global 14))
  (export "TypeId.ArrayBool" (global 15))
  (export "TypeId.ArrayUint8Array" (global 16))
  (export "TypeId.ArrayEthereumValue" (global 17))
  (export "TypeId.ArrayStoreValue" (global 18))
  (export "TypeId.ArrayJsonValue" (global 19))
  (export "TypeId.ArrayString" (global 20))
  (export "TypeId.ArrayEventParam" (global 21))
  (export "TypeId.ArrayTypedMapEntryStringJsonValue" (global 22))
  (export "TypeId.ArrayTypedMapEntryStringStoreValue" (global 23))
  (export "TypeId.SmartContractCall" (global 24))
  (export "TypeId.EventParam" (global 25))
  (export "TypeId.EthereumTransaction" (global 26))
  (export "TypeId.EthereumBlock" (global 27))
  (export "TypeId.EthereumCall" (global 28))
  (export "TypeId.WrappedTypedMapStringJsonValue" (global 29))
  (export "TypeId.WrappedBool" (global 30))
  (export "TypeId.WrappedJsonValue" (global 31))
  (export "TypeId.EthereumValue" (global 32))
  (export "TypeId.StoreValue" (global 33))
  (export "TypeId.JsonValue" (global 34))
  (export "TypeId.EthereumEvent" (global 35))
  (export "TypeId.TypedMapEntryStringStoreValue" (global 36))
  (export "TypeId.TypedMapEntryStringJsonValue" (global 37))
  (export "TypeId.TypedMapStringStoreValue" (global 38))
  (export "TypeId.TypedMapStringJsonValue" (global 39))
  (export "TypeId.TypedMapStringTypedMapStringJsonValue" (global 40))
  (export "TypeId.ResultTypedMapStringJsonValueBool" (global 41))
  (export "TypeId.ResultJsonValueBool" (global 42))
  (export "TypeId.ArrayU8" (global 43))
  (export "TypeId.ArrayU16" (global 44))
  (export "TypeId.ArrayU32" (global 45))
  (export "TypeId.ArrayU64" (global 46))
  (export "TypeId.ArrayI8" (global 47))
  (export "TypeId.ArrayI16" (global 48))
  (export "TypeId.ArrayI32" (global 49))
  (export "TypeId.ArrayI64" (global 50))
  (export "TypeId.ArrayF32" (global 51))
  (export "TypeId.ArrayF64" (global 52))
  (export "TypeId.ArrayBigDecimal" (global 53))
  (export "TypeId.NearArrayDataReceiver" (global 54))
  (export "TypeId.NearArrayCryptoHash" (global 55))
  (export "TypeId.NearArrayActionValue" (global 56))
  (export "TypeId.NearMerklePath" (global 57))
  (export "TypeId.NearArrayValidatorStake" (global 58))
  (export "TypeId.NearArraySlashedValidator" (global 59))
  (export "TypeId.NearArraySignature" (global 60))
  (export "TypeId.NearArrayChunkHeader" (global 61))
  (export "TypeId.NearAccessKeyPermissionValue" (global 62))
  (export "TypeId.NearActionValue" (global 63))
  (export "TypeId.NearDirection" (global 64))
  (export "TypeId.NearPublicKey" (global 65))
  (export "TypeId.NearSignature" (global 66))
  (export "TypeId.NearFunctionCallPermission" (global 67))
  (export "TypeId.NearFullAccessPermission" (global 68))
  (export "TypeId.NearAccessKey" (global 69))
  (export "TypeId.NearDataReceiver" (global 70))
  (export "TypeId.NearCreateAccountAction" (global 71))
  (export "TypeId.NearDeployContractAction" (global 72))
  (export "TypeId.NearFunctionCallAction" (global 73))
  (export "TypeId.NearTransferAction" (global 74))
  (export "TypeId.NearStakeAction" (global 75))
  (export "TypeId.NearAddKeyAction" (global 76))
  (export "TypeId.NearDeleteKeyAction" (global 77))
  (export "TypeId.NearDeleteAccountAction" (global 78))
  (export "TypeId.NearActionReceipt" (global 79))
  (export "TypeId.NearSuccessStatus" (global 80))
  (export "TypeId.NearMerklePathItem" (global 81))
  (export "TypeId.NearExecutionOutcome" (global 82))
  (export "TypeId.NearSlashedValidator" (global 83))
  (export "TypeId.NearBlockHeader" (global 84))
  (export "TypeId.NearValidatorStake" (global 85))
  (export "TypeId.NearChunkHeader" (global 86))
  (export "TypeId.NearBlock" (global 87))
  (export "TypeId.NearReceiptWithOutcome" (global 88))
  (export "TypeId.TransactionReceipt" (global 89))
  (export "TypeId.Log" (global 90))
  (export "TypeId.ArrayH256" (global 91))
  (export "TypeId.ArrayLog" (global 92))
  (export "TypeId.CosmosAny" (global 93))
  (export "TypeId.CosmosAnyArray" (global 94))
  (export "TypeId.CosmosBytesArray" (global 95))
  (export "TypeId.CosmosCoinArray" (global 96))
  (export "TypeId.CosmosCommitSigArray" (global 97))
  (export "TypeId.CosmosEventArray" (global 98))
  (export "TypeId.CosmosEventAttributeArray" (global 99))
  (export "TypeId.CosmosEvidenceArray" (global 100))
  (export "TypeId.CosmosModeInfoArray" (global 101))
  (export "TypeId.CosmosSignerInfoArray" (global 102))
  (export "TypeId.CosmosTxResultArray" (global 103))
  (export "TypeId.CosmosValidatorArray" (global 104))
  (export "TypeId.CosmosValidatorUpdateArray" (global 105))
  (export "TypeId.CosmosAuthInfo" (global 106))
  (export "TypeId.CosmosBlock" (global 107))
  (export "TypeId.CosmosBlockId" (global 108))
  (export "TypeId.CosmosBlockIdFlagEnum" (global 109))
  (export "TypeId.CosmosBlockParams" (global 110))
  (export "TypeId.CosmosCoin" (global 111))
  (export "TypeId.CosmosCommit" (global 112))
  (export "TypeId.CosmosCommitSig" (global 113))
  (export "TypeId.CosmosCompactBitArray" (global 114))
  (export "TypeId.CosmosConsensus" (global 115))
  (export "TypeId.CosmosConsensusParams" (global 116))
  (export "TypeId.CosmosDuplicateVoteEvidence" (global 117))
  (export "TypeId.CosmosDuration" (global 118))
  (export "TypeId.CosmosEvent" (global 119))
  (export "TypeId.CosmosEventAttribute" (global 120))
  (export "TypeId.CosmosEventData" (global 121))
  (export "TypeId.CosmosEventVote" (global 122))
  (export "TypeId.CosmosEvidence" (global 123))
  (export "TypeId.CosmosEvidenceList" (global 124))
  (export "TypeId.CosmosEvidenceParams" (global 125))
  (export "TypeId.CosmosFee" (global 126))
  (export "TypeId.CosmosHeader" (global 127))
  (export "TypeId.CosmosHeaderOnlyBlock" (global 128))
  (export "TypeId.CosmosLightBlock" (global 129))
  (export "TypeId.CosmosLightClientAttackEvidence" (global 130))
  (export "TypeId.CosmosModeInfo" (global 131))
  (export "TypeId.CosmosModeInfoMulti" (global 132))
  (export "TypeId.CosmosModeInfoSingle" (global 133))
  (export "TypeId.CosmosPartSetHeader" (global 134))
  (export "TypeId.CosmosPublicKey" (global 135))
  (export "TypeId.CosmosResponseBeginBlock" (global 136))
  (export "TypeId.CosmosResponseDeliverTx" (global 137))
  (export "TypeId.CosmosResponseEndBlock" (global 138))
  (export "TypeId.CosmosSignModeEnum" (global 139))
  (export "TypeId.CosmosSignedHeader" (global 140))
  (export "TypeId.CosmosSignedMsgTypeEnum" (global 141))
  (export "TypeId.CosmosSignerInfo" (global 142))
  (export "TypeId.CosmosTimestamp" (global 143))
  (export "TypeId.CosmosTip" (global 144))
  (export "TypeId.CosmosTransactionData" (global 145))
  (export "TypeId.CosmosTx" (global 146))
  (export "TypeId.CosmosTxBody" (global 147))
  (export "TypeId.CosmosTxResult" (global 148))
  (export "TypeId.CosmosValidator" (global 149))
  (export "TypeId.CosmosValidatorParams" (global 150))
  (export "TypeId.CosmosValidatorSet" (global 151))
  (export "TypeId.CosmosValidatorSetUpdates" (global 152))
  (export "TypeId.CosmosValidatorUpdate" (global 153))
  (export "TypeId.CosmosVersionParams" (global 154))
  (export "TypeId.CosmosMessageData" (global 155))
  (export "TypeId.CosmosTransactionContext" (global 156))
  (export "TypeId.ArweaveBlock" (global 157))
  (export "TypeId.ArweaveProofOfAccess" (global 158))
  (export "TypeId.ArweaveTag" (global 159))
  (export "TypeId.ArweaveTagArray" (global 160))
  (export "TypeId.ArweaveTransaction" (global 161))
  (export "TypeId.ArweaveTransactionArray" (global 162))
  (export "TypeId.ArweaveTransactionWithBlockPtr" (global 163))
  (export "TypeId.StarknetBlock" (global 164))
  (export "TypeId.StarknetTransaction" (global 165))
  (export "TypeId.StarknetTransactionTypeEnum" (global 166))
  (export "TypeId.StarknetEvent" (global 167))
  (export "TypeId.StarknetArrayBytes" (global 168))
  (export "id_of_type" (func $node_modules/@graphprotocol/graph-ts/global/global/id_of_type))
  (export "allocate" (func $node_modules/@graphprotocol/graph-ts/global/global/allocate))
  (export "memory" (memory 0))
  (export "table" (table 0))
  (export "_start" (func $~start))
  (elem $0 (i32.const 1) func $start:tests/utils/math.test~anonymous|0 $start:tests/utils/math.test~anonymous|1)
  (data (;0;) (i32.const 1036) "<")
  (data (;1;) (i32.const 1048) "\01\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
  (data (;2;) (i32.const 1100) "<")
  (data (;3;) (i32.const 1112) "\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
  (data (;4;) (i32.const 1164) "\1c")
  (data (;5;) (i32.const 1176) "\01\00\00\00\0c\00\00\00S\00t\00r\00i\00n\00g")
  (data (;6;) (i32.const 1196) "\1c")
  (data (;7;) (i32.const 1208) "\01\00\00\00\06\00\00\00I\00n\00t")
  (data (;8;) (i32.const 1228) ",")
  (data (;9;) (i32.const 1240) "\01\00\00\00\14\00\00\00B\00i\00g\00D\00e\00c\00i\00m\00a\00l")
  (data (;10;) (i32.const 1276) "\1c")
  (data (;11;) (i32.const 1288) "\01\00\00\00\08\00\00\00b\00o\00o\00l")
  (data (;12;) (i32.const 1308) "\1c")
  (data (;13;) (i32.const 1320) "\01\00\00\00\0a\00\00\00A\00r\00r\00a\00y")
  (data (;14;) (i32.const 1340) "\1c")
  (data (;15;) (i32.const 1352) "\01\00\00\00\08\00\00\00n\00u\00l\00l")
  (data (;16;) (i32.const 1372) "\1c")
  (data (;17;) (i32.const 1384) "\01\00\00\00\0a\00\00\00B\00y\00t\00e\00s")
  (data (;18;) (i32.const 1404) "\1c")
  (data (;19;) (i32.const 1416) "\01\00\00\00\0c\00\00\00B\00i\00g\00I\00n\00t")
  (data (;20;) (i32.const 1436) "\1c")
  (data (;21;) (i32.const 1448) "\01\00\00\00\08\00\00\00I\00n\00t\008")
  (data (;22;) (i32.const 1468) ",")
  (data (;23;) (i32.const 1480) "\01\00\00\00\12\00\00\00T\00i\00m\00e\00s\00t\00a\00m\00p")
  (data (;24;) (i32.const 1516) "<")
  (data (;25;) (i32.const 1532) "(\00\00\00\a0\04\00\00\c0\04\00\00\e0\04\00\00\10\05\00\000\05\00\00P\05\00\00p\05\00\00\90\05\00\00\b0\05\00\00\d0\05")
  (data (;26;) (i32.const 1580) ",")
  (data (;27;) (i32.const 1592) "\03\00\00\00\10\00\00\00\00\06\00\00\00\06\00\00(\00\00\00\0a")
  (data (;28;) (i32.const 1628) "l")
  (data (;29;) (i32.const 1640) "\01\00\00\00T\00\00\000\00x\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000")
  (data (;30;) (i32.const 1740) ",")
  (data (;31;) (i32.const 1752) "\01\00\00\00\0e\00\00\00m\00a\00i\00n\00n\00e\00t")
  (data (;32;) (i32.const 1788) ",")
  (data (;33;) (i32.const 1800) "\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
  (data (;34;) (i32.const 1836) ",")
  (data (;35;) (i32.const 1848) "\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;36;) (i32.const 1884) "l")
  (data (;37;) (i32.const 1896) "\01\00\00\00T\00\00\000\00x\00A\001\006\000\008\001\00F\003\006\000\00e\003\008\004\007\000\000\006\00d\00B\006\006\000\00b\00a\00e\001\00c\006\00d\001\00b\002\00e\001\007\00e\00C\002\00A")
  (data (;38;) (i32.const 1996) "<")
  (data (;39;) (i32.const 2008) "\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
  (data (;40;) (i32.const 2060) "<")
  (data (;41;) (i32.const 2072) "\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
  (data (;42;) (i32.const 2124) "<")
  (data (;43;) (i32.const 2136) "\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;44;) (i32.const 2188) "<")
  (data (;45;) (i32.const 2200) "\01\00\00\00 \00\00\00d\00e\00f\00a\00u\00l\00t\00_\00l\00o\00g\00_\00t\00y\00p\00e")
  (data (;46;) (i32.const 2252) "\9c")
  (data (;47;) (i32.const 2264) "\01\00\00\00\86\00\00\00Y\00o\00u\00 \00c\00a\00n\00'\00t\00 \00m\00o\00d\00i\00f\00y\00 \00a\00 \00M\00o\00c\00k\00e\00d\00F\00u\00n\00c\00t\00i\00o\00n\00 \00i\00n\00s\00t\00a\00n\00c\00e\00 \00a\00f\00t\00e\00r\00 \00i\00t\00 \00h\00a\00s\00 \00b\00e\00e\00n\00 \00s\00a\00v\00e\00d\00.")
  (data (;48;) (i32.const 2412) "\1c")
  (data (;49;) (i32.const 2424) "\01\00\00\00\02\00\00\000")
  (data (;50;) (i32.const 2444) ",")
  (data (;51;) (i32.const 2456) "\01\00\00\00\18\00\00\00p\00a\00n\00c\00a\00k\00e\00-\00s\00w\00a\00p")
  (data (;52;) (i32.const 2492) ",")
  (data (;53;) (i32.const 2504) "\01\00\00\00\0e\00\00\00u\00n\00i\00s\00w\00a\00p")
  (data (;54;) (i32.const 2540) "\cc")
  (data (;55;) (i32.const 2552) "\01\00\00\00\b2\00\00\00W\00h\00e\00n\00 \00p\00a\00s\00s\00i\00n\00g\00 \00t\00h\00e\00 \00`\00b\00`\00 \00p\00a\00r\00a\00m\00 \00a\00s\00 \00z\00e\00r\00o\00 \00i\00n\00 \00s\00a\00f\00e\00D\00i\00v\00,\00 \00i\00n\00s\00t\00e\00a\00d\00 \00o\00f\00 \00t\00h\00r\00o\00w\00i\00n\00g\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00r\00e\00t\00u\00r\00n\00 \00z\00e\00r\00o")
  (data (;56;) (i32.const 2748) "\1c")
  (data (;57;) (i32.const 2760) "\01\00\00\00\02\00\00\001")
  (data (;58;) (i32.const 2780) "\9c")
  (data (;59;) (i32.const 2792) "\01\00\00\00~\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00s\00u\00b\00t\00r\00a\00c\00t\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;60;) (i32.const 2940) "l")
  (data (;61;) (i32.const 2952) "\01\00\00\00\5c\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00n\00u\00m\00b\00e\00r\00s\00.\00t\00s")
  (data (;62;) (i32.const 3052) "\8c")
  (data (;63;) (i32.const 3064) "\01\00\00\00z\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00d\00i\00v\00i\00d\00e\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;64;) (i32.const 3196) "L")
  (data (;65;) (i32.const 3208) "\01\00\00\000\00\00\00t\00e\00s\00t\00s\00/\00u\00t\00i\00l\00s\00/\00m\00a\00t\00h\00.\00t\00e\00s\00t\00.\00t\00s")
  (data (;66;) (i32.const 3276) "\1c")
  (data (;67;) (i32.const 3288) "\10\00\00\00\08\00\00\00\01")
  (data (;68;) (i32.const 3308) "\cc")
  (data (;69;) (i32.const 3320) "\01\00\00\00\ae\00\00\00W\00h\00e\00n\00 \00p\00a\00s\00s\00i\00n\00g\00 \00t\00h\00e\00 \00`\00a\00`\00 \00a\00n\00d\00 \00`\00b\00`\00 \00p\00a\00r\00a\00m\00 \00a\00s\00 \00n\00o\00n\00 \00z\00e\00r\00o\00 \00i\00n\00 \00s\00a\00f\00e\00D\00i\00v\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00s\00i\00m\00p\00l\00y\00 \00d\00i\00v\00i\00d\00e\00 \00t\00h\00e\00m")
  (data (;70;) (i32.const 3516) "\1c")
  (data (;71;) (i32.const 3528) "\01\00\00\00\04\00\00\001\000")
  (data (;72;) (i32.const 3548) "\1c")
  (data (;73;) (i32.const 3560) "\01\00\00\00\02\00\00\002")
  (data (;74;) (i32.const 3580) "\1c")
  (data (;75;) (i32.const 3592) "\01\00\00\00\02\00\00\005")
  (data (;76;) (i32.const 3612) "\1c")
  (data (;77;) (i32.const 3624) "\10\00\00\00\08\00\00\00\02")
  (data (;78;) (i32.const 3644) "<")
  (data (;79;) (i32.const 3660) "(\00\00\00\a0\04\00\00\c0\04\00\00\e0\04\00\00\10\05\00\000\05\00\00P\05\00\00p\05\00\00\90\05\00\00\b0\05\00\00\d0\05")
  (data (;80;) (i32.const 3708) ",")
  (data (;81;) (i32.const 3720) "\03\00\00\00\10\00\00\00P\0e\00\00P\0e\00\00(\00\00\00\0a"))
