(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (type (;9;) (func (param i64) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (import "env" "abort" (func $~lib/builtins/abort (type 8)))
  (import "conversion" "typeConversion.stringToH160" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160 (type 0)))
  (import "numbers" "bigDecimal.fromString" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString (type 0)))
  (import "datasource" "dataSource.network" (func $~lib/@graphprotocol/graph-ts/common/datasource/dataSource.network (type 5)))
  (import "numbers" "bigDecimal.toString" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.toString (type 0)))
  (import "conversion" "typeConversion.bytesToHex" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex (type 0)))
  (import "conversion" "typeConversion.bigIntToString" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString (type 0)))
  (import "index" "store.set" (func $~lib/@graphprotocol/graph-ts/index/store.set (type 2)))
  (import "index" "store.get" (func $~lib/@graphprotocol/graph-ts/index/store.get (type 1)))
  (import "numbers" "bigInt.pow" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.pow (type 1)))
  (import "numbers" "bigInt.times" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.times (type 1)))
  (import "numbers" "bigDecimal.dividedBy" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.dividedBy (type 1)))
  (import "numbers" "bigDecimal.times" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.times (type 1)))
  (import "numbers" "bigDecimal.minus" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.minus (type 1)))
  (import "assert" "_assert.equalsWithMessage" (func $~lib/matchstick-as/assert/_assert.equalsWithMessage (type 3)))
  (import "assert" "_assert.equals" (func $~lib/matchstick-as/assert/_assert.equals (type 1)))
  (import "index" "_registerTest" (func $~lib/matchstick-as/index/_registerTest (type 2)))
  (func $~lib/rt/stub/__alloc (type 0) (param i32) (result i32)
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
    local.tee 0
    memory.size
    local.tee 2
    i32.const 16
    i32.shl
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee 1
    i32.gt_u
    if  ;; label = @1
      local.get 2
      local.get 0
      local.get 1
      i32.sub
      i32.const 65535
      i32.add
      i32.const -65536
      i32.and
      i32.const 16
      i32.shr_u
      local.tee 1
      local.get 1
      local.get 2
      i32.lt_s
      select
      memory.grow
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        local.get 1
        memory.grow
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          unreachable
        end
      end
    end
    local.get 0
    global.set $~lib/rt/stub/offset
    local.get 3
    local.get 5
    i32.store
    local.get 4)
  (func $~lib/rt/stub/__new (type 1) (param i32 i32) (result i32)
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
  (func $~lib/memory/memory.fill (type 4) (param i32 i32)
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
  (func $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor (type 0) (param i32) (result i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        local.get 0
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
    local.get 0)
  (func $~lib/typedarray/Uint8Array#constructor (type 1) (param i32 i32) (result i32)
    (local i32)
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        local.get 0
        i32.eqz
        if  ;; label = @3
          i32.const 12
          i32.const 13
          call $~lib/rt/stub/__new
          local.set 0
        end
        local.get 0
      end
      i32.eqz
      if  ;; label = @2
        i32.const 12
        i32.const 2
        call $~lib/rt/stub/__new
        local.set 0
      end
      local.get 0
    end
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 1
    i32.const 1073741820
    i32.gt_u
    if  ;; label = @1
      i32.const 1808
      i32.const 2016
      i32.const 18
      i32.const 57
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 2
    local.get 1
    call $~lib/memory/memory.fill
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 0)
  (func $~lib/typedarray/Uint8Array#__set (type 2) (param i32 i32 i32)
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
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32 (type 0) (param i32) (result i32)
    (local i32)
    i32.const 12
    i32.const 12
    call $~lib/rt/stub/__new
    i32.const 4
    call $~lib/typedarray/Uint8Array#constructor
    local.tee 1
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
  (func $~lib/util/memory/memcpy (type 2) (param i32 i32 i32)
    (local i32 i32 i32)
    loop  ;; label = @1
      local.get 1
      i32.const 3
      i32.and
      i32.const 0
      local.get 2
      select
      if  ;; label = @2
        local.get 0
        local.tee 3
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        local.tee 4
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 4
        i32.load8_u
        i32.store8
        local.get 2
        i32.const 1
        i32.sub
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 0
    i32.const 3
    i32.and
    i32.eqz
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 16
        i32.ge_u
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 0
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 0
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 1
          i32.const 16
          i32.add
          local.set 1
          local.get 0
          i32.const 16
          i32.add
          local.set 0
          local.get 2
          i32.const 16
          i32.sub
          local.set 2
          br 1 (;@2;)
        end
      end
      local.get 2
      i32.const 8
      i32.and
      if  ;; label = @2
        block (result i32)  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 0
          i32.const 8
          i32.add
        end
        local.set 0
      end
      local.get 2
      i32.const 4
      i32.and
      if  ;; label = @2
        block (result i32)  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 0
          i32.const 4
          i32.add
        end
        local.set 0
      end
      local.get 2
      i32.const 2
      i32.and
      if  ;; label = @2
        block (result i32)  ;; label = @3
          local.get 0
          local.get 1
          i32.load16_u
          i32.store16
          local.get 1
          i32.const 2
          i32.add
          local.set 1
          local.get 0
          i32.const 2
          i32.add
        end
        local.set 0
      end
      local.get 2
      i32.const 1
      i32.and
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load8_u
        i32.store8
      end
      return
    end
    local.get 2
    i32.const 32
    i32.ge_u
    if  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.and
              i32.const 1
              i32.sub
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;)
            end
            local.get 1
            i32.load
            local.set 5
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.load8_u
            i32.store8
            local.get 0
            local.tee 4
            i32.const 2
            i32.add
            local.set 0
            local.get 1
            local.tee 3
            i32.const 2
            i32.add
            local.set 1
            local.get 4
            local.get 3
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 2
            i32.const 3
            i32.sub
            local.set 2
            loop  ;; label = @5
              local.get 2
              i32.const 17
              i32.ge_u
              if  ;; label = @6
                local.get 0
                local.get 1
                i32.load offset=1
                local.tee 3
                i32.const 8
                i32.shl
                local.get 5
                i32.const 24
                i32.shr_u
                i32.or
                i32.store
                local.get 0
                local.get 3
                i32.const 24
                i32.shr_u
                local.get 1
                i32.load offset=5
                local.tee 3
                i32.const 8
                i32.shl
                i32.or
                i32.store offset=4
                local.get 0
                local.get 3
                i32.const 24
                i32.shr_u
                local.get 1
                i32.load offset=9
                local.tee 3
                i32.const 8
                i32.shl
                i32.or
                i32.store offset=8
                local.get 0
                local.get 1
                i32.load offset=13
                local.tee 5
                i32.const 8
                i32.shl
                local.get 3
                i32.const 24
                i32.shr_u
                i32.or
                i32.store offset=12
                local.get 1
                i32.const 16
                i32.add
                local.set 1
                local.get 0
                i32.const 16
                i32.add
                local.set 0
                local.get 2
                i32.const 16
                i32.sub
                local.set 2
                br 1 (;@5;)
              end
            end
            br 2 (;@2;)
          end
          local.get 1
          i32.load
          local.set 5
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 0
          local.tee 4
          i32.const 2
          i32.add
          local.set 0
          local.get 1
          local.tee 3
          i32.const 2
          i32.add
          local.set 1
          local.get 4
          local.get 3
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const 2
          i32.sub
          local.set 2
          loop  ;; label = @4
            local.get 2
            i32.const 18
            i32.ge_u
            if  ;; label = @5
              local.get 0
              local.get 1
              i32.load offset=2
              local.tee 3
              i32.const 16
              i32.shl
              local.get 5
              i32.const 16
              i32.shr_u
              i32.or
              i32.store
              local.get 0
              local.get 3
              i32.const 16
              i32.shr_u
              local.get 1
              i32.load offset=6
              local.tee 3
              i32.const 16
              i32.shl
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.const 16
              i32.shr_u
              local.get 1
              i32.load offset=10
              local.tee 3
              i32.const 16
              i32.shl
              i32.or
              i32.store offset=8
              local.get 0
              local.get 1
              i32.load offset=14
              local.tee 5
              i32.const 16
              i32.shl
              local.get 3
              i32.const 16
              i32.shr_u
              i32.or
              i32.store offset=12
              local.get 1
              i32.const 16
              i32.add
              local.set 1
              local.get 0
              i32.const 16
              i32.add
              local.set 0
              local.get 2
              i32.const 16
              i32.sub
              local.set 2
              br 1 (;@4;)
            end
          end
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.set 5
        local.get 0
        local.tee 3
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        local.tee 4
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 4
        i32.load8_u
        i32.store8
        local.get 2
        i32.const 1
        i32.sub
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 19
          i32.ge_u
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.load offset=3
            local.tee 3
            i32.const 24
            i32.shl
            local.get 5
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 0
            local.get 3
            i32.const 8
            i32.shr_u
            local.get 1
            i32.load offset=7
            local.tee 3
            i32.const 24
            i32.shl
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            i32.const 8
            i32.shr_u
            local.get 1
            i32.load offset=11
            local.tee 3
            i32.const 24
            i32.shl
            i32.or
            i32.store offset=8
            local.get 0
            local.get 1
            i32.load offset=15
            local.tee 5
            i32.const 24
            i32.shl
            local.get 3
            i32.const 8
            i32.shr_u
            i32.or
            i32.store offset=12
            local.get 1
            i32.const 16
            i32.add
            local.set 1
            local.get 0
            i32.const 16
            i32.add
            local.set 0
            local.get 2
            i32.const 16
            i32.sub
            local.set 2
            br 1 (;@3;)
          end
        end
      end
    end
    local.get 2
    i32.const 16
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.tee 4
      i32.const 2
      i32.add
      local.set 0
      local.get 1
      local.tee 3
      i32.const 2
      i32.add
      local.set 1
      local.get 4
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
    end
    local.get 2
    i32.const 8
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.tee 4
      i32.const 2
      i32.add
      local.set 0
      local.get 1
      local.tee 3
      i32.const 2
      i32.add
      local.set 1
      local.get 4
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
    end
    local.get 2
    i32.const 4
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.tee 4
      i32.const 2
      i32.add
      local.set 0
      local.get 1
      local.tee 3
      i32.const 2
      i32.add
      local.set 1
      local.get 4
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
    end
    local.get 2
    i32.const 2
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      local.tee 4
      i32.const 2
      i32.add
      local.set 0
      local.get 1
      local.tee 3
      i32.const 2
      i32.add
      local.set 1
      local.get 4
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
    end
    local.get 2
    i32.const 1
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
    end)
  (func $~lib/memory/memory.copy (type 2) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 2
      local.set 4
      local.get 0
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.sub
      local.get 4
      i32.sub
      i32.const 0
      local.get 4
      i32.const 1
      i32.shl
      i32.sub
      i32.le_u
      if  ;; label = @2
        local.get 0
        local.get 1
        local.get 4
        call $~lib/util/memory/memcpy
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      i32.lt_u
      if  ;; label = @2
        local.get 1
        i32.const 7
        i32.and
        local.get 0
        i32.const 7
        i32.and
        i32.eq
        if  ;; label = @3
          loop  ;; label = @4
            local.get 0
            i32.const 7
            i32.and
            if  ;; label = @5
              local.get 4
              i32.eqz
              br_if 4 (;@1;)
              local.get 4
              i32.const 1
              i32.sub
              local.set 4
              local.get 0
              local.tee 2
              i32.const 1
              i32.add
              local.set 0
              local.get 1
              local.tee 3
              i32.const 1
              i32.add
              local.set 1
              local.get 2
              local.get 3
              i32.load8_u
              i32.store8
              br 1 (;@4;)
            end
          end
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.ge_u
            if  ;; label = @5
              local.get 0
              local.get 1
              i64.load
              i64.store
              local.get 4
              i32.const 8
              i32.sub
              local.set 4
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 1
              i32.const 8
              i32.add
              local.set 1
              br 1 (;@4;)
            end
          end
        end
        loop  ;; label = @3
          local.get 4
          if  ;; label = @4
            local.get 0
            local.tee 2
            i32.const 1
            i32.add
            local.set 0
            local.get 1
            local.tee 3
            i32.const 1
            i32.add
            local.set 1
            local.get 2
            local.get 3
            i32.load8_u
            i32.store8
            local.get 4
            i32.const 1
            i32.sub
            local.set 4
            br 1 (;@3;)
          end
        end
      else
        local.get 1
        i32.const 7
        i32.and
        local.get 0
        i32.const 7
        i32.and
        i32.eq
        if  ;; label = @3
          loop  ;; label = @4
            local.get 0
            local.get 4
            i32.add
            i32.const 7
            i32.and
            if  ;; label = @5
              local.get 4
              i32.eqz
              br_if 4 (;@1;)
              local.get 4
              i32.const 1
              i32.sub
              local.tee 4
              local.get 0
              i32.add
              local.get 1
              local.get 4
              i32.add
              i32.load8_u
              i32.store8
              br 1 (;@4;)
            end
          end
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.ge_u
            if  ;; label = @5
              local.get 4
              i32.const 8
              i32.sub
              local.tee 4
              local.get 0
              i32.add
              local.get 1
              local.get 4
              i32.add
              i64.load
              i64.store
              br 1 (;@4;)
            end
          end
        end
        loop  ;; label = @3
          local.get 4
          if  ;; label = @4
            local.get 4
            i32.const 1
            i32.sub
            local.tee 4
            local.get 0
            i32.add
            local.get 1
            local.get 4
            i32.add
            i32.load8_u
            i32.store8
            br 1 (;@3;)
          end
        end
      end
    end)
  (func $~lib/string/String#concat (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.shl
    local.tee 3
    local.get 1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.shl
    local.tee 4
    i32.add
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 2592
      return
    end
    local.get 2
    i32.const 1
    call $~lib/rt/stub/__new
    local.tee 2
    local.get 0
    local.get 3
    call $~lib/memory/memory.copy
    local.get 2
    local.get 3
    i32.add
    local.get 1
    local.get 4
    call $~lib/memory/memory.copy
    local.get 2)
  (func $~lib/rt/__newArray (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.const 2
    i32.shl
    local.tee 4
    local.set 5
    local.get 4
    i32.const 0
    call $~lib/rt/stub/__new
    local.set 3
    local.get 2
    if  ;; label = @1
      local.get 3
      local.get 2
      local.get 5
      call $~lib/memory/memory.copy
    end
    i32.const 16
    local.get 1
    call $~lib/rt/stub/__new
    local.tee 1
    local.get 3
    i32.store
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 4
    i32.store offset=8
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1)
  (func $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get (type 1) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=12
    i32.ge_u
    if  ;; label = @1
      i32.const 2080
      i32.const 1856
      i32.const 106
      i32.const 42
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.load offset=4
    local.get 1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee 0
    i32.eqz
    if  ;; label = @1
      i32.const 3136
      i32.const 1856
      i32.const 110
      i32.const 40
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0)
  (func $~lib/string/String.__eq (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.get 1
    i32.eq
    if  ;; label = @1
      i32.const 1
      return
    end
    local.get 1
    i32.const 0
    local.get 0
    select
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.tee 4
    local.get 1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.ne
    if  ;; label = @1
      i32.const 0
      return
    end
    block (result i32)  ;; label = @1
      local.get 0
      local.set 2
      local.get 1
      local.set 3
      local.get 2
      i32.const 7
      i32.and
      local.get 3
      i32.const 7
      i32.and
      i32.or
      i32.const 1
      local.get 4
      local.tee 0
      i32.const 4
      i32.ge_u
      select
      i32.eqz
      if  ;; label = @2
        loop  ;; label = @3
          local.get 2
          i64.load
          local.get 3
          i64.load
          i64.eq
          if  ;; label = @4
            local.get 2
            i32.const 8
            i32.add
            local.set 2
            local.get 3
            i32.const 8
            i32.add
            local.set 3
            local.get 0
            i32.const 4
            i32.sub
            local.tee 0
            i32.const 4
            i32.ge_u
            br_if 1 (;@3;)
          end
        end
      end
      loop  ;; label = @2
        local.get 0
        local.tee 1
        i32.const 1
        i32.sub
        local.set 0
        local.get 1
        if  ;; label = @3
          local.get 2
          i32.load16_u
          local.tee 1
          local.get 3
          i32.load16_u
          local.tee 4
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 4
            i32.sub
            br 3 (;@1;)
          end
          local.get 2
          i32.const 2
          i32.add
          local.set 2
          local.get 3
          i32.const 2
          i32.add
          local.set 3
          br 1 (;@2;)
        end
      end
      i32.const 0
    end
    i32.eqz)
  (func $~lib/rt/stub/__renew (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.const 1073741804
    i32.gt_u
    if  ;; label = @1
      i32.const 1056
      i32.const 1120
      i32.const 99
      i32.const 30
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    i32.const 16
    i32.add
    local.set 3
    local.get 0
    i32.const 16
    i32.sub
    local.tee 0
    i32.const 15
    i32.and
    i32.const 1
    local.get 0
    select
    if  ;; label = @1
      i32.const 0
      i32.const 1120
      i32.const 45
      i32.const 3
      call $~lib/builtins/abort
      unreachable
    end
    global.get $~lib/rt/stub/offset
    local.get 0
    local.get 0
    i32.const 4
    i32.sub
    local.tee 6
    i32.load
    local.tee 5
    i32.add
    i32.eq
    local.set 4
    local.get 3
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    i32.const 4
    i32.sub
    local.set 2
    local.get 3
    local.get 5
    i32.gt_u
    if  ;; label = @1
      local.get 4
      if  ;; label = @2
        local.get 3
        i32.const 1073741820
        i32.gt_u
        if  ;; label = @3
          i32.const 1056
          i32.const 1120
          i32.const 52
          i32.const 33
          call $~lib/builtins/abort
          unreachable
        end
        local.get 0
        local.get 2
        i32.add
        local.tee 3
        memory.size
        local.tee 5
        i32.const 16
        i32.shl
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        local.tee 4
        i32.gt_u
        if  ;; label = @3
          local.get 5
          local.get 3
          local.get 4
          i32.sub
          i32.const 65535
          i32.add
          i32.const -65536
          i32.and
          i32.const 16
          i32.shr_u
          local.tee 4
          local.get 4
          local.get 5
          i32.lt_s
          select
          memory.grow
          i32.const 0
          i32.lt_s
          if  ;; label = @4
            local.get 4
            memory.grow
            i32.const 0
            i32.lt_s
            if  ;; label = @5
              unreachable
            end
          end
        end
        local.get 3
        global.set $~lib/rt/stub/offset
        local.get 6
        local.get 2
        i32.store
      else
        local.get 2
        local.get 5
        i32.const 1
        i32.shl
        local.tee 3
        local.get 2
        local.get 3
        i32.gt_u
        select
        call $~lib/rt/stub/__alloc
        local.tee 2
        local.get 0
        local.get 5
        call $~lib/memory/memory.copy
        local.get 2
        local.set 0
      end
    else
      local.get 4
      if  ;; label = @2
        local.get 0
        local.get 2
        i32.add
        global.set $~lib/rt/stub/offset
        local.get 6
        local.get 2
        i32.store
      end
    end
    local.get 0
    i32.const 4
    i32.sub
    local.get 1
    i32.store offset=16
    local.get 0
    i32.const 16
    i32.add)
  (func $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#push (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.tee 6
    i32.const 1
    i32.add
    local.tee 5
    local.set 2
    local.get 5
    local.get 0
    i32.load offset=8
    local.tee 4
    i32.const 2
    i32.shr_u
    i32.gt_u
    if  ;; label = @1
      local.get 2
      i32.const 268435455
      i32.gt_u
      if  ;; label = @2
        i32.const 1808
        i32.const 1856
        i32.const 17
        i32.const 48
        call $~lib/builtins/abort
        unreachable
      end
      local.get 4
      local.get 0
      i32.load
      local.tee 7
      local.get 4
      i32.const 1
      i32.shl
      local.tee 3
      i32.const 1073741820
      local.get 3
      i32.const 1073741820
      i32.lt_u
      select
      local.tee 3
      local.get 2
      i32.const 8
      local.get 2
      i32.const 8
      i32.gt_u
      select
      i32.const 2
      i32.shl
      local.tee 2
      local.get 2
      local.get 3
      i32.lt_u
      select
      local.tee 3
      call $~lib/rt/stub/__renew
      local.tee 2
      i32.add
      local.get 3
      local.get 4
      i32.sub
      call $~lib/memory/memory.fill
      local.get 2
      local.get 7
      i32.ne
      if  ;; label = @2
        local.get 0
        local.get 2
        i32.store
        local.get 0
        local.get 2
        i32.store offset=4
      end
      local.get 0
      local.get 3
      i32.store offset=8
    end
    local.get 0
    i32.load offset=4
    local.get 6
    i32.const 2
    i32.shl
    i32.add
    local.get 1
    i32.store
    local.get 0
    local.get 5
    i32.store offset=12)
  (func $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set (type 2) (param i32 i32 i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 4
        local.get 3
        i32.load
        i32.load offset=12
        i32.lt_s
        if  ;; label = @3
          local.get 3
          i32.load
          local.get 4
          call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
          i32.load
          local.get 1
          call $~lib/string/String.__eq
          if  ;; label = @4
            local.get 3
            i32.load
            local.get 4
            call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
            br 3 (;@1;)
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          br 1 (;@2;)
        end
      end
      i32.const 0
    end
    local.tee 3
    if  ;; label = @1
      local.get 3
      local.get 2
      i32.store offset=4
    else
      i32.const 8
      i32.const 8
      call $~lib/rt/stub/__new
      local.tee 3
      i32.const 0
      i32.store
      local.get 3
      i32.const 0
      i32.store offset=4
      local.get 3
      local.get 1
      i32.store
      local.get 3
      local.get 2
      i32.store offset=4
      local.get 0
      i32.load
      local.get 3
      call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#push
    end)
  (func $generated/schema/Token#constructor (type 1) (param i32 i32) (result i32)
    (local i32 i64)
    local.get 0
    if (result i32)  ;; label = @1
      local.get 0
    else
      i32.const 4
      i32.const 20
      call $~lib/rt/stub/__new
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.tee 2
    local.set 0
    local.get 1
    i64.extend_i32_u
    local.set 3
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 6
    i32.store
    local.get 1
    local.get 3
    i64.store offset=8
    local.get 0
    i32.const 3104
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 2)
  (func $generated/schema/Token#set:usdPrice (type 4) (param i32 i32)
    (local i64)
    local.get 1
    i64.extend_i32_u
    local.set 2
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 2
    i64.store offset=8
    local.get 0
    i32.const 3312
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set)
  (func $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get (type 1) (param i32 i32) (result i32)
    (local i32)
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.load
      i32.load offset=12
      i32.lt_s
      if  ;; label = @2
        local.get 0
        i32.load
        local.get 2
        call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
        i32.load
        local.get 1
        call $~lib/string/String.__eq
        if  ;; label = @3
          local.get 0
          i32.load
          local.get 2
          call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
          i32.load offset=4
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
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toString (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    if  ;; label = @1
      i32.const 3776
      i32.const 3840
      i32.const 93
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toI32 (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 5
    i32.eq
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    i32.load
    i32.const 1
    i32.ne
    if  ;; label = @1
      i32.const 3952
      i32.const 3840
      i32.const 72
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/util/number/utoa32_dec_lut (type 2) (param i32 i32 i32)
    (local i32)
    loop  ;; label = @1
      local.get 1
      i32.const 10000
      i32.ge_u
      if  ;; label = @2
        local.get 1
        i32.const 10000
        i32.rem_u
        local.set 3
        local.get 1
        i32.const 10000
        i32.div_u
        local.set 1
        local.get 0
        local.get 2
        i32.const 4
        i32.sub
        local.tee 2
        i32.const 1
        i32.shl
        i32.add
        local.get 3
        i32.const 100
        i32.div_u
        i32.const 2
        i32.shl
        i32.const 4188
        i32.add
        i64.load32_u
        local.get 3
        i32.const 100
        i32.rem_u
        i32.const 2
        i32.shl
        i32.const 4188
        i32.add
        i64.load32_u
        i64.const 32
        i64.shl
        i64.or
        i64.store
        br 1 (;@1;)
      end
    end
    block (result i32)  ;; label = @1
      local.get 1
      i32.const 100
      i32.ge_u
      if  ;; label = @2
        block (result i32)  ;; label = @3
          local.get 0
          local.get 2
          i32.const 2
          i32.sub
          local.tee 2
          i32.const 1
          i32.shl
          i32.add
          local.get 1
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 4188
          i32.add
          i32.load
          i32.store
          local.get 1
          i32.const 100
          i32.div_u
        end
        local.set 1
      end
      local.get 1
    end
    i32.const 10
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 2
      i32.const 2
      i32.sub
      i32.const 1
      i32.shl
      i32.add
      local.get 1
      i32.const 2
      i32.shl
      i32.const 4188
      i32.add
      i32.load
      i32.store
    else
      local.get 0
      local.get 2
      i32.const 1
      i32.sub
      i32.const 1
      i32.shl
      i32.add
      local.get 1
      i32.const 48
      i32.add
      i32.store16
    end)
  (func $~lib/util/number/itoa32 (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 2432
      return
    end
    i32.const 0
    local.get 0
    i32.sub
    local.get 0
    local.get 0
    i32.const 31
    i32.shr_u
    local.tee 1
    select
    local.tee 2
    local.tee 0
    i32.const 100000
    i32.lt_u
    if (result i32)  ;; label = @1
      local.get 0
      i32.const 100
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 0
        i32.const 10
        i32.ge_u
        i32.const 1
        i32.add
      else
        local.get 0
        i32.const 10000
        i32.ge_u
        i32.const 3
        i32.add
        local.get 0
        i32.const 1000
        i32.ge_u
        i32.add
      end
    else
      local.get 0
      i32.const 10000000
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 0
        i32.const 1000000
        i32.ge_u
        i32.const 6
        i32.add
      else
        local.get 0
        i32.const 1000000000
        i32.ge_u
        i32.const 8
        i32.add
        local.get 0
        i32.const 100000000
        i32.ge_u
        i32.add
      end
    end
    local.get 1
    i32.add
    local.tee 3
    i32.const 1
    i32.shl
    i32.const 1
    call $~lib/rt/stub/__new
    local.tee 0
    local.get 2
    local.get 3
    call $~lib/util/number/utoa32_dec_lut
    local.get 1
    if  ;; label = @1
      local.get 0
      i32.const 45
      i32.store16
    end
    local.get 0)
  (func $~lib/util/number/itoa64 (type 9) (param i64) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    i64.eqz
    if  ;; label = @1
      i32.const 2432
      return
    end
    i64.const 0
    local.get 0
    i64.sub
    local.get 0
    local.get 0
    i64.const 63
    i64.shr_u
    i32.wrap_i64
    local.tee 3
    select
    local.tee 0
    i64.const 4294967295
    i64.le_u
    if  ;; label = @1
      local.get 0
      i32.wrap_i64
      local.tee 2
      local.tee 1
      i32.const 100000
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 1
        i32.const 100
        i32.lt_u
        if (result i32)  ;; label = @3
          local.get 1
          i32.const 10
          i32.ge_u
          i32.const 1
          i32.add
        else
          local.get 1
          i32.const 10000
          i32.ge_u
          i32.const 3
          i32.add
          local.get 1
          i32.const 1000
          i32.ge_u
          i32.add
        end
      else
        local.get 1
        i32.const 10000000
        i32.lt_u
        if (result i32)  ;; label = @3
          local.get 1
          i32.const 1000000
          i32.ge_u
          i32.const 6
          i32.add
        else
          local.get 1
          i32.const 1000000000
          i32.ge_u
          i32.const 8
          i32.add
          local.get 1
          i32.const 100000000
          i32.ge_u
          i32.add
        end
      end
      local.get 3
      i32.add
      local.tee 1
      i32.const 1
      i32.shl
      i32.const 1
      call $~lib/rt/stub/__new
      local.tee 4
      local.get 2
      local.get 1
      call $~lib/util/number/utoa32_dec_lut
    else
      local.get 0
      i64.const 1000000000000000
      i64.lt_u
      if (result i32)  ;; label = @2
        local.get 0
        i64.const 1000000000000
        i64.lt_u
        if (result i32)  ;; label = @3
          local.get 0
          i64.const 100000000000
          i64.ge_u
          i32.const 10
          i32.add
          local.get 0
          i64.const 10000000000
          i64.ge_u
          i32.add
        else
          local.get 0
          i64.const 100000000000000
          i64.ge_u
          i32.const 13
          i32.add
          local.get 0
          i64.const 10000000000000
          i64.ge_u
          i32.add
        end
      else
        local.get 0
        i64.const 100000000000000000
        i64.lt_u
        if (result i32)  ;; label = @3
          local.get 0
          i64.const 10000000000000000
          i64.ge_u
          i32.const 16
          i32.add
        else
          local.get 0
          i64.const -8446744073709551616
          i64.ge_u
          i32.const 18
          i32.add
          local.get 0
          i64.const 1000000000000000000
          i64.ge_u
          i32.add
        end
      end
      local.get 3
      i32.add
      local.tee 1
      i32.const 1
      i32.shl
      i32.const 1
      call $~lib/rt/stub/__new
      local.tee 4
      local.set 2
      loop  ;; label = @2
        local.get 0
        i64.const 100000000
        i64.ge_u
        if  ;; label = @3
          local.get 2
          local.get 1
          i32.const 4
          i32.sub
          local.tee 1
          i32.const 1
          i32.shl
          i32.add
          local.get 0
          local.get 0
          i64.const 100000000
          i64.div_u
          local.tee 0
          i64.const 100000000
          i64.mul
          i64.sub
          i32.wrap_i64
          local.tee 5
          i32.const 10000
          i32.rem_u
          local.tee 6
          i32.const 100
          i32.div_u
          i32.const 2
          i32.shl
          i32.const 4188
          i32.add
          i64.load32_u
          local.get 6
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 4188
          i32.add
          i64.load32_u
          i64.const 32
          i64.shl
          i64.or
          i64.store
          local.get 2
          local.get 1
          i32.const 4
          i32.sub
          local.tee 1
          i32.const 1
          i32.shl
          i32.add
          local.get 5
          i32.const 10000
          i32.div_u
          local.tee 5
          i32.const 100
          i32.div_u
          i32.const 2
          i32.shl
          i32.const 4188
          i32.add
          i64.load32_u
          local.get 5
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 4188
          i32.add
          i64.load32_u
          i64.const 32
          i64.shl
          i64.or
          i64.store
          br 1 (;@2;)
        end
      end
      local.get 2
      local.get 0
      i32.wrap_i64
      local.get 1
      call $~lib/util/number/utoa32_dec_lut
    end
    local.get 3
    if  ;; label = @1
      local.get 4
      i32.const 45
      i32.store16
    end
    local.get 4)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toBigDecimal (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 2
    i32.ne
    if  ;; label = @1
      i32.const 5824
      i32.const 3840
      i32.const 103
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData~anonymous|0 (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData)
  (func $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/value/Value>#map<~lib/string/String> (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.tee 4
    i32.const 3
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 5
    i32.load offset=4
    local.set 6
    loop  ;; label = @1
      local.get 2
      local.get 4
      local.get 0
      i32.load offset=12
      local.tee 3
      local.get 3
      local.get 4
      i32.gt_s
      select
      i32.lt_s
      if  ;; label = @2
        local.get 2
        i32.const 2
        i32.shl
        local.tee 3
        local.get 0
        i32.load offset=4
        i32.add
        i32.load
        local.set 7
        i32.const 3
        global.set $~argumentsLength
        local.get 3
        local.get 6
        i32.add
        local.get 7
        local.get 2
        local.get 0
        local.get 1
        i32.load
        call_indirect $0 (type 3)
        i32.store
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 5)
  (func $~lib/util/string/joinStringArray (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.const 1
    i32.sub
    local.tee 7
    i32.const 0
    i32.lt_s
    if  ;; label = @1
      i32.const 2592
      return
    end
    local.get 7
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      if (result i32)  ;; label = @2
        local.get 0
      else
        i32.const 2592
      end
      return
    end
    loop  ;; label = @1
      local.get 1
      local.get 5
      i32.gt_s
      if  ;; label = @2
        local.get 0
        local.get 5
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee 6
        if  ;; label = @3
          local.get 4
          local.get 6
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          i32.add
          local.set 4
        end
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 4
    local.get 7
    local.get 2
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.tee 4
    i32.mul
    i32.add
    i32.const 1
    i32.shl
    i32.const 1
    call $~lib/rt/stub/__new
    local.set 1
    i32.const 0
    local.set 5
    loop  ;; label = @1
      local.get 5
      local.get 7
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 5
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee 6
        if  ;; label = @3
          block (result i32)  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.shl
            i32.add
            local.get 6
            local.get 6
            i32.const 20
            i32.sub
            i32.load offset=16
            i32.const 1
            i32.shr_u
            local.tee 6
            i32.const 1
            i32.shl
            call $~lib/memory/memory.copy
            local.get 3
            local.get 6
            i32.add
          end
          local.set 3
        end
        local.get 4
        if  ;; label = @3
          block (result i32)  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.shl
            i32.add
            local.get 2
            local.get 4
            i32.const 1
            i32.shl
            call $~lib/memory/memory.copy
            local.get 3
            local.get 4
            i32.add
          end
          local.set 3
        end
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 0
    local.get 7
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee 0
    if  ;; label = @1
      local.get 1
      local.get 3
      i32.const 1
      i32.shl
      i32.add
      local.get 0
      local.get 0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.const 1
      i32.shl
      call $~lib/memory/memory.copy
    end
    local.get 1)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 6
    i32.ne
    if  ;; label = @1
      i32.const 6240
      i32.const 3840
      i32.const 64
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData (type 0) (param i32) (result i32)
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
                        local.get 0
                        i32.load
                        br_table 0 (;@10;) 1 (;@9;) 3 (;@7;) 4 (;@6;) 5 (;@5;) 6 (;@4;) 7 (;@3;) 8 (;@2;) 2 (;@8;) 2 (;@8;) 9 (;@1;)
                      end
                      local.get 0
                      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
                      return
                    end
                    local.get 0
                    call $~lib/@graphprotocol/graph-ts/common/value/Value#toI32
                    call $~lib/util/number/itoa32
                    return
                  end
                  local.get 0
                  i32.load
                  i32.const 5
                  i32.eq
                  if (result i64)  ;; label = @8
                    i64.const 0
                  else
                    local.get 0
                    i32.load
                    i32.const 8
                    i32.ne
                    if  ;; label = @9
                      i32.const 5760
                      i32.const 3840
                      i32.const 80
                      i32.const 5
                      call $~lib/builtins/abort
                      unreachable
                    end
                    local.get 0
                    i64.load offset=8
                  end
                  call $~lib/util/number/itoa64
                  return
                end
                local.get 0
                call $~lib/@graphprotocol/graph-ts/common/value/Value#toBigDecimal
                call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.toString
                return
              end
              i32.const 5984
              i32.const 6016
              local.get 0
              i32.load
              i32.const 5
              i32.eq
              if (result i32)  ;; label = @6
                i32.const 0
              else
                local.get 0
                i32.load
                i32.const 3
                i32.ne
                if  ;; label = @7
                  i32.const 5904
                  i32.const 3840
                  i32.const 59
                  i32.const 5
                  call $~lib/builtins/abort
                  unreachable
                end
                local.get 0
                i64.load offset=8
                i64.const 0
                i64.ne
              end
              select
              return
            end
            local.get 0
            i32.load
            i32.const 4
            i32.ne
            if  ;; label = @5
              i32.const 6048
              i32.const 3840
              i32.const 108
              i32.const 5
              call $~lib/builtins/abort
              unreachable
            end
            i32.const 6112
            local.get 0
            i64.load offset=8
            i32.wrap_i64
            i32.const 6144
            call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/value/Value>#map<~lib/string/String>
            local.tee 0
            i32.load offset=4
            local.get 0
            i32.load offset=12
            i32.const 6176
            call $~lib/util/string/joinStringArray
            call $~lib/string/String#concat
            i32.const 6208
            call $~lib/string/String#concat
            return
          end
          i32.const 1360
          return
        end
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
        call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
        return
      end
      local.get 0
      i32.load
      i32.const 7
      i32.ne
      if  ;; label = @2
        i32.const 6320
        i32.const 3840
        i32.const 98
        i32.const 5
        call $~lib/builtins/abort
        unreachable
      end
      local.get 0
      i64.load offset=8
      i32.wrap_i64
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
      return
    end
    i32.const 6484
    local.get 0
    i32.load
    call $~lib/util/number/itoa32
    i32.store
    i32.const 6480
    i32.const 6476
    i32.load
    i32.const 2
    i32.shr_u
    i32.const 2592
    call $~lib/util/string/joinStringArray)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 1612
    i32.load
    i32.ge_s
    if  ;; label = @1
      i32.const 6564
      local.get 0
      i32.load
      call $~lib/util/number/itoa32
      i32.store
      i32.const 6560
      i32.const 6556
      i32.load
      i32.const 2
      i32.shr_u
      i32.const 2592
      call $~lib/util/string/joinStringArray
      return
    end
    i32.const 1600
    local.get 0
    i32.load
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get)
  (func $generated/schema/Token#save (type 6) (param i32)
    (local i32)
    local.get 0
    i32.const 3104
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 3360
      i32.const 3456
      i32.const 13
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    if  ;; label = @1
      local.get 1
      i32.load
      i32.const 6
      i32.ne
      if  ;; label = @2
        i32.const 3732
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        i32.store
        i32.const 3740
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        i32.store
        i32.const 3728
        i32.const 3724
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 2592
        call $~lib/util/string/joinStringArray
        i32.const 3456
        i32.const 15
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 6592
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
      local.get 0
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end)
  (func $tests/mocks/TokenMock#constructor@varargs (type 5) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          global.get $~argumentsLength
          br_table 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        unreachable
      end
      i32.const 2992
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
      local.set 1
    end
    i32.const 8
    i32.const 38
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store offset=4
    local.get 0
    local.get 1
    call $generated/schema/Token#constructor
    local.tee 0
    local.get 1
    i32.store offset=4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 1
    i32.store
    local.get 1
    i64.const 8
    i64.store offset=8
    local.get 0
    i32.const 3264
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 0
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    call $generated/schema/Token#set:usdPrice
    local.get 0
    call $generated/schema/Token#save
    local.get 0)
  (func $generated/schema/Pool#save (type 6) (param i32)
    (local i32)
    local.get 0
    i32.const 3104
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 7744
      i32.const 3456
      i32.const 79
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    if  ;; label = @1
      local.get 1
      i32.load
      i32.const 6
      i32.ne
      if  ;; label = @2
        i32.const 8004
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        i32.store
        i32.const 8012
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        i32.store
        i32.const 8000
        i32.const 7996
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 2592
        call $~lib/util/string/joinStringArray
        i32.const 3456
        i32.const 81
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 8048
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
      local.get 0
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end)
  (func $tests/mocks/PoolMock#constructor (type 5) (result i32)
    (local i32 i32 i32 i32 i64)
    i32.const 8
    i32.const 37
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store offset=4
    i32.const 2992
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    local.tee 3
    local.set 1
    local.get 0
    if (result i32)  ;; label = @1
      local.get 0
    else
      i32.const 4
      i32.const 21
      call $~lib/rt/stub/__new
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.tee 2
    local.set 0
    local.get 1
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 6
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 3104
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 0
    local.get 3
    i32.store offset=4
    i32.const 0
    global.set $~argumentsLength
    call $tests/mocks/TokenMock#constructor@varargs
    i32.load offset=4
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 6
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 6624
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 0
    global.set $~argumentsLength
    call $tests/mocks/TokenMock#constructor@varargs
    i32.load offset=4
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 6
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 6656
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 1
    i32.store
    local.get 1
    i64.const 0
    i64.store offset=8
    local.get 0
    i32.const 6688
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 1
    i32.store
    local.get 1
    i64.const 0
    i64.store offset=8
    local.get 0
    i32.const 6736
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 6784
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 6848
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 6912
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 124
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 7
    i32.store
    local.get 1
    local.get 4
    i64.store offset=8
    local.get 0
    i32.const 6976
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 8
    i32.const 42
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store offset=4
    local.get 0
    if (result i32)  ;; label = @1
      local.get 0
    else
      i32.const 4
      i32.const 43
      call $~lib/rt/stub/__new
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.set 0
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i64.const 7040
    i64.store offset=8
    local.get 0
    i32.const 3104
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 0
    i32.const 7040
    i32.store offset=4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i64.const 7088
    i64.store offset=8
    local.get 0
    i32.const 7136
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i64.const 7168
    i64.store offset=8
    local.get 0
    i32.const 7216
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i64.const 7248
    i64.store offset=8
    local.get 0
    i32.const 7296
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 0
    i32.const 3104
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 7328
      i32.const 3456
      i32.const 493
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    if  ;; label = @1
      local.get 1
      i32.load
      if  ;; label = @2
        i32.const 7604
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        i32.store
        i32.const 7612
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        i32.store
        i32.const 7600
        i32.const 7596
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 2592
        call $~lib/util/string/joinStringArray
        i32.const 3456
        i32.const 495
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 7648
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
      local.get 0
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end
    local.get 0
    i32.load offset=4
    i64.extend_i32_u
    local.set 4
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    local.get 4
    i64.store offset=8
    local.get 2
    i32.const 7696
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 2
    call $generated/schema/Pool#save
    local.get 2)
  (func $~lib/typedarray/Uint8Array#__get (type 1) (param i32 i32) (result i32)
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
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.fromU32 (type 0) (param i32) (result i32)
    (local i32 i32)
    i32.const 12
    i32.const 12
    call $~lib/rt/stub/__new
    i32.const 4
    call $~lib/typedarray/Uint8Array#constructor
    local.tee 1
    i32.const 0
    local.get 0
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 1
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 2
    local.get 0
    i32.const 16
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 3
    local.get 0
    i32.const 24
    i32.shr_u
    call $~lib/typedarray/Uint8Array#__set
    i32.const 0
    local.set 0
    local.get 1
    i32.load offset=8
    i32.const 1
    i32.add
    local.set 2
    i32.const 12
    i32.const 14
    call $~lib/rt/stub/__new
    local.get 2
    call $~lib/typedarray/Uint8Array#constructor
    local.set 2
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.load offset=8
      i32.lt_s
      if  ;; label = @2
        local.get 2
        local.get 0
        local.get 1
        local.get 0
        call $~lib/typedarray/Uint8Array#__get
        call $~lib/typedarray/Uint8Array#__set
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    local.get 2
    local.get 1
    i32.load offset=8
    i32.const 0
    call $~lib/typedarray/Uint8Array#__set
    local.get 2)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor (type 10) (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    block (result i32)  ;; label = @1
      local.get 0
      i32.eqz
      if  ;; label = @2
        i32.const 32
        i32.const 24
        call $~lib/rt/stub/__new
        local.set 0
      end
      local.get 0
    end
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 4
    i32.store offset=12
    local.get 0
    local.get 5
    i32.store offset=16
    local.get 0
    local.get 6
    i32.store offset=20
    local.get 0
    local.get 7
    i32.store offset=24
    local.get 0
    local.get 8
    i32.store offset=28
    local.get 0)
  (func $tests/v3-pools/mappings/pool/v3-pool-initialize.test/createEvent (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 3
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 1
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 8
    i32.const 60
    i32.const 25
    call $~lib/rt/stub/__new
    local.tee 2
    local.get 1
    i32.store
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    local.get 8
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=16
    local.get 2
    local.get 1
    i32.store offset=20
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 3
    i32.store offset=28
    local.get 2
    local.get 3
    i32.store offset=32
    local.get 2
    local.get 3
    i32.store offset=36
    local.get 2
    local.get 3
    i32.store offset=40
    local.get 2
    local.get 3
    i32.store offset=44
    local.get 2
    local.get 3
    i32.store offset=48
    local.get 2
    local.get 3
    i32.store offset=52
    local.get 2
    local.get 3
    i32.store offset=56
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 1
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 6
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 5
    i32.const 36
    i32.const 26
    call $~lib/rt/stub/__new
    local.tee 4
    local.get 5
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 6
    i32.store offset=8
    local.get 4
    local.get 6
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=16
    local.get 4
    local.get 1
    i32.store offset=20
    local.get 4
    local.get 1
    i32.store offset=24
    local.get 4
    local.get 5
    i32.store offset=28
    local.get 4
    local.get 1
    i32.store offset=32
    i32.const 0
    i32.const 29
    i32.const 8400
    call $~lib/rt/__newArray
    local.set 13
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 9
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 6
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 14
    i32.const 1
    i32.const 34
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 10
    i32.load offset=4
    drop
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 15
    i32.const 1
    i32.const 32
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 11
    i32.load offset=4
    drop
    local.get 11
    i32.load offset=4
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.tee 5
    i32.store
    global.get $~lib/matchstick-as/defaults/defaultIntBytes
    local.set 16
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 7
    i32.const 1
    i32.const 33
    call $~lib/rt/stub/__new
    local.tee 12
    i32.const 0
    i32.store8
    local.get 12
    i32.const 0
    i32.store8
    i32.const 44
    i32.const 31
    call $~lib/rt/stub/__new
    local.tee 1
    local.get 15
    i32.store
    local.get 1
    local.get 11
    i32.store offset=4
    local.get 1
    local.get 5
    i32.store offset=8
    local.get 1
    local.get 5
    i32.store offset=12
    local.get 1
    local.get 16
    i32.store offset=16
    local.get 1
    local.get 5
    i32.store offset=20
    local.get 1
    local.get 7
    i32.store offset=24
    local.get 1
    local.get 7
    i32.store offset=28
    local.get 1
    local.get 7
    i32.store offset=32
    local.get 1
    i32.const 2208
    i32.store offset=36
    local.get 1
    local.get 12
    i32.store offset=40
    local.get 10
    i32.load offset=4
    local.get 1
    i32.store
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 7
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 5
    i32.const 44
    i32.const 30
    call $~lib/rt/stub/__new
    local.tee 1
    local.get 9
    i32.store
    local.get 1
    local.get 6
    i32.store offset=4
    local.get 1
    local.get 9
    i32.store offset=8
    local.get 1
    local.get 6
    i32.store offset=12
    local.get 1
    local.get 6
    i32.store offset=16
    local.get 1
    local.get 6
    i32.store offset=20
    local.get 1
    local.get 14
    i32.store offset=24
    local.get 1
    local.get 10
    i32.store offset=28
    local.get 1
    local.get 7
    i32.store offset=32
    local.get 1
    local.get 5
    i32.store offset=36
    local.get 1
    local.get 5
    i32.store offset=40
    i32.const 0
    local.get 8
    local.get 3
    local.get 3
    i32.const 2208
    local.get 2
    local.get 4
    local.get 13
    local.get 1
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor
    local.set 2
    i32.const 2
    i32.const 29
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 1
    i32.load offset=4
    drop
    local.get 0
    i32.load offset=4
    i64.extend_i32_u
    local.set 17
    i32.const 16
    i32.const 28
    call $~lib/rt/stub/__new
    local.tee 3
    i32.const 4
    i32.store
    local.get 3
    local.get 17
    i64.store offset=8
    i32.const 8
    i32.const 27
    call $~lib/rt/stub/__new
    local.tee 4
    i32.const 8432
    i32.store
    local.get 4
    local.get 3
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 4
    i32.store
    local.get 0
    i32.load offset=8
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 17
    i32.const 16
    i32.const 28
    call $~lib/rt/stub/__new
    local.tee 3
    i32.const 3
    i32.store
    local.get 3
    local.get 17
    i64.store offset=8
    i32.const 8
    i32.const 27
    call $~lib/rt/stub/__new
    local.tee 4
    i32.const 8480
    i32.store
    local.get 4
    local.get 3
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 4
    i32.store offset=4
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.load offset=4
    local.set 3
    local.get 2
    i32.load offset=8
    local.set 4
    local.get 2
    i32.load offset=12
    local.set 6
    local.get 2
    i32.load offset=16
    local.set 5
    local.get 2
    i32.load offset=20
    local.set 7
    local.get 2
    i32.load offset=28
    local.set 2
    i32.const 32
    i32.const 45
    call $~lib/rt/stub/__new
    local.get 0
    local.get 3
    local.get 4
    local.get 6
    local.get 5
    local.get 7
    local.get 1
    local.get 2
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor)
  (func $generated/schema/Pool#get:token0 (type 0) (param i32) (result i32)
    local.get 0
    i32.const 6624
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 0
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 8704
      i32.const 3456
      i32.const 113
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
    end)
  (func $generated/schema/Pool#get:token1 (type 0) (param i32) (result i32)
    local.get 0
    i32.const 6656
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 0
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 8704
      i32.const 3456
      i32.const 126
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
    end)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#toBigDecimal (type 0) (param i32) (result i32)
    (local i32)
    i32.const 8
    i32.const 15
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    local.get 0
    i32.store
    local.get 1
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i32.store offset=4
    local.get 1)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#div (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 9168
      i32.const 8288
      i32.const 391
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.dividedBy)
  (func $src/utils/token-utils/tokenBaseAmount (type 0) (param i32) (result i32)
    i32.const 10
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.fromU32
    local.get 0
    i32.const 3264
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 0
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 0
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toI32
    end
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.pow)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#times (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 9312
      i32.const 8288
      i32.const 385
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.times)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.compare (type 1) (param i32 i32) (result i32)
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
  (func $src/utils/current-network/CurrentNetwork.get:stablecoinsAddresses (type 5) (result i32)
    call $~lib/@graphprotocol/graph-ts/common/datasource/dataSource.network
    i32.const 1760
    call $~lib/string/String.__eq
    if  ;; label = @1
      i32.const 6
      i32.const 3
      i32.const 10336
      call $~lib/rt/__newArray
      return
    end
    i32.const 0
    i32.const 10384
    i32.const 27
    i32.const 5
    call $~lib/builtins/abort
    unreachable)
  (func $~lib/string/String#toLowerCase (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.tee 8
    i32.eqz
    if  ;; label = @1
      local.get 0
      return
    end
    local.get 8
    i32.const 2
    i32.shl
    i32.const 1
    call $~lib/rt/stub/__new
    local.set 7
    loop  ;; label = @1
      local.get 4
      local.get 8
      i32.lt_u
      if  ;; label = @2
        local.get 0
        local.get 4
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
        local.tee 1
        i32.const 7
        i32.shr_u
        if  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 8
            i32.const 1
            i32.sub
            i32.lt_u
            i32.const 0
            local.get 1
            i32.const 55295
            i32.sub
            i32.const 1025
            i32.lt_u
            select
            if  ;; label = @5
              local.get 0
              local.get 4
              i32.const 1
              i32.shl
              i32.add
              i32.load16_u offset=2
              local.tee 5
              i32.const 56319
              i32.sub
              i32.const 1025
              i32.lt_u
              if  ;; label = @6
                local.get 4
                i32.const 1
                i32.add
                local.set 4
                local.get 5
                i32.const 1023
                i32.and
                local.get 1
                local.tee 2
                i32.const 1023
                i32.and
                i32.const 10
                i32.shl
                i32.or
                i32.const 65536
                i32.add
                local.tee 1
                i32.const 131072
                i32.ge_u
                if  ;; label = @7
                  local.get 7
                  local.get 6
                  i32.const 1
                  i32.shl
                  i32.add
                  local.get 2
                  local.get 5
                  i32.const 16
                  i32.shl
                  i32.or
                  i32.store
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 6
                  br 3 (;@4;)
                end
              end
            end
            local.get 1
            i32.const 304
            i32.eq
            if  ;; label = @5
              local.get 7
              local.get 6
              i32.const 1
              i32.shl
              i32.add
              i32.const 50790505
              i32.store
              local.get 6
              i32.const 1
              i32.add
              local.set 6
            else
              local.get 1
              i32.const 931
              i32.eq
              if  ;; label = @6
                local.get 7
                local.get 6
                i32.const 1
                i32.shl
                i32.add
                i32.const 962
                i32.const 963
                local.get 8
                i32.const 1
                i32.gt_u
                if (result i32)  ;; label = @7
                  block (result i32)  ;; label = @8
                    i32.const 0
                    local.set 3
                    i32.const 0
                    local.get 4
                    local.tee 2
                    i32.const 30
                    i32.sub
                    local.tee 1
                    local.get 1
                    i32.const 0
                    i32.lt_s
                    select
                    local.set 10
                    loop  ;; label = @9
                      local.get 2
                      local.get 10
                      i32.gt_s
                      if  ;; label = @10
                        i32.const -1
                        local.set 1
                        block  ;; label = @11
                          local.get 2
                          i32.const 0
                          i32.le_s
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 2
                          i32.const 1
                          i32.sub
                          i32.const 1
                          i32.shl
                          i32.add
                          i32.load16_u
                          local.tee 5
                          i32.const 64512
                          i32.and
                          i32.const 56320
                          i32.eq
                          local.get 2
                          i32.const 2
                          i32.sub
                          i32.const 0
                          i32.ge_s
                          i32.and
                          if  ;; label = @12
                            local.get 5
                            i32.const 1023
                            i32.and
                            local.get 0
                            local.get 2
                            i32.const 2
                            i32.sub
                            i32.const 1
                            i32.shl
                            i32.add
                            i32.load16_u
                            local.tee 9
                            i32.const 1023
                            i32.and
                            i32.const 10
                            i32.shl
                            i32.add
                            i32.const 65536
                            i32.add
                            local.set 1
                            local.get 9
                            i32.const 64512
                            i32.and
                            i32.const 55296
                            i32.eq
                            br_if 1 (;@11;)
                          end
                          i32.const 65533
                          local.get 5
                          local.get 5
                          i32.const 63488
                          i32.and
                          i32.const 55296
                          i32.eq
                          select
                          local.set 1
                        end
                        local.get 1
                        i32.const 918000
                        i32.lt_u
                        if (result i32)  ;; label = @11
                          local.get 1
                          i32.const 8
                          i32.shr_u
                          i32.const 10572
                          i32.add
                          i32.load8_u
                          i32.const 5
                          i32.shl
                          i32.const 10572
                          i32.add
                          local.get 1
                          i32.const 255
                          i32.and
                          i32.const 3
                          i32.shr_u
                          i32.add
                          i32.load8_u
                          local.get 1
                          i32.const 7
                          i32.and
                          i32.shr_u
                          i32.const 1
                          i32.and
                        else
                          i32.const 0
                        end
                        i32.eqz
                        if  ;; label = @11
                          block (result i32)  ;; label = @12
                            i32.const 0
                            local.get 1
                            i32.const 127370
                            i32.lt_u
                            if (result i32)  ;; label = @13
                              local.get 1
                              i32.const 8
                              i32.shr_u
                              i32.const 13580
                              i32.add
                              i32.load8_u
                              i32.const 5
                              i32.shl
                              i32.const 13580
                              i32.add
                              local.get 1
                              i32.const 255
                              i32.and
                              i32.const 3
                              i32.shr_u
                              i32.add
                              i32.load8_u
                              local.get 1
                              i32.const 7
                              i32.and
                              i32.shr_u
                              i32.const 1
                              i32.and
                            else
                              i32.const 0
                            end
                            i32.eqz
                            br_if 4 (;@8;)
                            drop
                            i32.const 1
                          end
                          local.set 3
                        end
                        local.get 2
                        local.get 1
                        i32.const 65536
                        i32.ge_s
                        i32.const 1
                        i32.add
                        i32.sub
                        local.set 2
                        br 1 (;@9;)
                      end
                    end
                    i32.const 0
                    local.get 3
                    i32.eqz
                    br_if 0 (;@8;)
                    drop
                    local.get 4
                    i32.const 1
                    i32.add
                    local.tee 2
                    i32.const 30
                    i32.add
                    local.tee 1
                    local.get 8
                    local.get 1
                    local.get 8
                    i32.lt_s
                    select
                    local.set 3
                    loop  ;; label = @9
                      local.get 2
                      local.get 3
                      i32.lt_s
                      if  ;; label = @10
                        block (result i32)  ;; label = @11
                          local.get 0
                          local.get 2
                          i32.const 1
                          i32.shl
                          i32.add
                          i32.load16_u
                          local.tee 1
                          i32.const 64512
                          i32.and
                          i32.const 55296
                          i32.eq
                          local.get 8
                          local.get 2
                          i32.const 1
                          i32.add
                          i32.ne
                          i32.and
                          if  ;; label = @12
                            local.get 0
                            local.get 2
                            i32.const 1
                            i32.shl
                            i32.add
                            i32.load16_u offset=2
                            local.tee 5
                            i32.const 64512
                            i32.and
                            i32.const 56320
                            i32.eq
                            if  ;; label = @13
                              local.get 5
                              local.get 1
                              i32.const 10
                              i32.shl
                              i32.add
                              i32.const 56613888
                              i32.sub
                              local.set 1
                            end
                          end
                          local.get 1
                        end
                        i32.const 918000
                        i32.lt_u
                        if (result i32)  ;; label = @11
                          local.get 1
                          i32.const 8
                          i32.shr_u
                          i32.const 10572
                          i32.add
                          i32.load8_u
                          i32.const 5
                          i32.shl
                          i32.const 10572
                          i32.add
                          local.get 1
                          i32.const 255
                          i32.and
                          i32.const 3
                          i32.shr_u
                          i32.add
                          i32.load8_u
                          local.get 1
                          i32.const 7
                          i32.and
                          i32.shr_u
                          i32.const 1
                          i32.and
                        else
                          i32.const 0
                        end
                        i32.eqz
                        if  ;; label = @11
                          local.get 1
                          i32.const 127370
                          i32.lt_u
                          if (result i32)  ;; label = @12
                            local.get 1
                            i32.const 8
                            i32.shr_u
                            i32.const 13580
                            i32.add
                            i32.load8_u
                            i32.const 5
                            i32.shl
                            i32.const 13580
                            i32.add
                            local.get 1
                            i32.const 255
                            i32.and
                            i32.const 3
                            i32.shr_u
                            i32.add
                            i32.load8_u
                            local.get 1
                            i32.const 7
                            i32.and
                            i32.shr_u
                            i32.const 1
                            i32.and
                          else
                            i32.const 0
                          end
                          i32.eqz
                          br 3 (;@8;)
                        end
                        local.get 2
                        local.get 1
                        i32.const 65536
                        i32.ge_u
                        i32.const 1
                        i32.add
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                    end
                    i32.const 1
                  end
                else
                  i32.const 0
                end
                select
                i32.store16
              else
                local.get 1
                i32.const 9398
                i32.sub
                i32.const 25
                i32.le_u
                if  ;; label = @7
                  local.get 7
                  local.get 6
                  i32.const 1
                  i32.shl
                  i32.add
                  local.get 1
                  i32.const 26
                  i32.add
                  i32.store16
                else
                  local.get 1
                  local.tee 2
                  i32.const 8
                  i32.shr_u
                  local.tee 1
                  i32.const 18788
                  i32.add
                  i32.load8_u
                  local.get 1
                  i32.const 15148
                  i32.add
                  i32.load8_u
                  i32.const 86
                  i32.mul
                  i32.const 15148
                  i32.add
                  local.get 2
                  i32.const 255
                  i32.and
                  local.tee 9
                  i32.const 3
                  i32.div_u
                  i32.add
                  i32.load8_u
                  local.get 9
                  i32.const 3
                  i32.rem_u
                  i32.const 2
                  i32.shl
                  i32.const 17816
                  i32.add
                  i32.load
                  i32.mul
                  i32.const 11
                  i32.shr_u
                  i32.const 6
                  i32.rem_u
                  i32.add
                  i32.const 2
                  i32.shl
                  i32.const 17828
                  i32.add
                  i32.load
                  local.tee 1
                  i32.const 8
                  i32.shr_s
                  local.set 5
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      i32.const 255
                      i32.and
                      local.tee 1
                      i32.const 2
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 255
                      i32.and
                      local.set 1
                      local.get 5
                      i32.const 8
                      i32.shr_u
                      local.set 3
                      loop  ;; label = @10
                        local.get 1
                        if  ;; label = @11
                          local.get 9
                          local.get 3
                          local.get 1
                          i32.const 1
                          i32.shr_u
                          local.tee 5
                          i32.add
                          i32.const 1
                          i32.shl
                          i32.const 19300
                          i32.add
                          i32.load8_u
                          local.tee 10
                          i32.eq
                          if (result i32)  ;; label = @12
                            local.get 3
                            local.get 5
                            i32.add
                            i32.const 1
                            i32.shl
                            i32.const 19300
                            i32.add
                            i32.load8_u offset=1
                            i32.const 2
                            i32.shl
                            i32.const 17828
                            i32.add
                            i32.load
                            local.tee 1
                            i32.const 8
                            i32.shr_s
                            local.set 5
                            local.get 1
                            i32.const 255
                            i32.and
                            local.tee 1
                            i32.const 2
                            i32.lt_u
                            br_if 3 (;@9;)
                            local.get 2
                            i32.const 1
                            i32.add
                            local.set 2
                            br 4 (;@8;)
                          else
                            local.get 9
                            local.get 10
                            i32.lt_u
                            if (result i32)  ;; label = @13
                              local.get 5
                            else
                              local.get 3
                              local.get 5
                              i32.add
                              local.set 3
                              local.get 1
                              local.get 5
                              i32.sub
                            end
                          end
                          local.set 1
                          br 1 (;@10;)
                        end
                      end
                      br 1 (;@8;)
                    end
                    local.get 2
                    local.get 5
                    i32.const 0
                    local.get 1
                    i32.sub
                    i32.and
                    i32.add
                    local.set 2
                  end
                  local.get 2
                  i32.const 2097151
                  i32.and
                  local.tee 1
                  i32.const 65536
                  i32.lt_u
                  if  ;; label = @8
                    local.get 7
                    local.get 6
                    i32.const 1
                    i32.shl
                    i32.add
                    local.get 1
                    i32.store16
                  else
                    local.get 7
                    local.get 6
                    i32.const 1
                    i32.shl
                    i32.add
                    local.get 1
                    i32.const 65536
                    i32.sub
                    local.tee 1
                    i32.const 10
                    i32.shr_u
                    i32.const 55296
                    i32.or
                    local.get 1
                    i32.const 1023
                    i32.and
                    i32.const 56320
                    i32.or
                    i32.const 16
                    i32.shl
                    i32.or
                    i32.store
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 6
                  end
                end
              end
            end
          end
        else
          local.get 7
          local.get 6
          i32.const 1
          i32.shl
          i32.add
          local.get 1
          i32.const 10444
          i32.add
          i32.load8_u
          i32.store16
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 6
        i32.const 1
        i32.add
        local.set 6
        br 1 (;@1;)
      end
    end
    local.get 7
    local.get 6
    i32.const 1
    i32.shl
    call $~lib/rt/stub/__renew)
  (func $src/utils/pool-utils/isVariableWithStablePool~anonymous|0 (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    call $~lib/string/String#toLowerCase)
  (func $~lib/array/Array<~lib/string/String>#includes (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      i32.const -1
      local.get 0
      i32.load offset=12
      local.tee 3
      i32.const 0
      i32.le_s
      i32.const 1
      local.get 3
      select
      br_if 0 (;@1;)
      drop
      local.get 0
      i32.load offset=4
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 3
        i32.lt_s
        if  ;; label = @3
          local.get 2
          local.get 0
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.get 1
          call $~lib/string/String.__eq
          br_if 2 (;@1;)
          drop
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          br 1 (;@2;)
        end
      end
      i32.const -1
    end
    i32.const 0
    i32.ge_s)
  (func $src/utils/pool-utils/isVariableWithStablePool (type 0) (param i32) (result i32)
    (local i32 i32)
    call $src/utils/current-network/CurrentNetwork.get:stablecoinsAddresses
    i32.const 19728
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/value/Value>#map<~lib/string/String>
    local.tee 2
    local.get 0
    call $generated/schema/Pool#get:token0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/string/String#toLowerCase
    call $~lib/array/Array<~lib/string/String>#includes
    local.set 1
    i32.const 0
    local.get 2
    local.get 0
    call $generated/schema/Pool#get:token1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/string/String#toLowerCase
    call $~lib/array/Array<~lib/string/String>#includes
    local.tee 0
    local.get 1
    select
    i32.const 1
    local.get 0
    i32.const 1
    local.get 1
    select
    select
    if  ;; label = @1
      i32.const 1
      return
    end
    i32.const 0)
  (func $src/utils/pool-utils/isStablePool (type 0) (param i32) (result i32)
    (local i32 i32)
    call $src/utils/current-network/CurrentNetwork.get:stablecoinsAddresses
    i32.const 19760
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/value/Value>#map<~lib/string/String>
    local.tee 1
    local.get 0
    call $generated/schema/Pool#get:token0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/string/String#toLowerCase
    call $~lib/array/Array<~lib/string/String>#includes
    local.set 2
    local.get 1
    local.get 0
    call $generated/schema/Pool#get:token1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/string/String#toLowerCase
    call $~lib/array/Array<~lib/string/String>#includes
    i32.const 0
    local.get 2
    select
    if  ;; label = @1
      i32.const 1
      return
    end
    i32.const 0)
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#equals (type 1) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load offset=8
    local.get 1
    i32.load offset=8
    i32.ne
    if  ;; label = @1
      i32.const 0
      return
    end
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.load offset=8
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 2
        call $~lib/typedarray/Uint8Array#__get
        local.get 1
        local.get 2
        call $~lib/typedarray/Uint8Array#__get
        i32.ne
        if  ;; label = @3
          i32.const 0
          return
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    i32.const 1)
  (func $src/utils/current-network/CurrentNetwork.get:wrappedNativeAddress (type 5) (result i32)
    call $~lib/@graphprotocol/graph-ts/common/datasource/dataSource.network
    i32.const 1760
    call $~lib/string/String.__eq
    if  ;; label = @1
      i32.const 20256
      return
    end
    i32.const 0
    i32.const 10384
    i32.const 12
    i32.const 5
    call $~lib/builtins/abort
    unreachable)
  (func $src/utils/pool-utils/isWrappedNativePool (type 0) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    call $generated/schema/Pool#get:token0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    local.set 1
    call $src/utils/current-network/CurrentNetwork.get:wrappedNativeAddress
    local.set 2
    local.get 1
    call $~lib/string/String#toLowerCase
    local.get 2
    call $~lib/string/String#toLowerCase
    call $~lib/string/String.__eq
    local.set 1
    local.get 0
    call $generated/schema/Pool#get:token1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    local.set 0
    call $src/utils/current-network/CurrentNetwork.get:wrappedNativeAddress
    local.set 2
    i32.const 1
    local.get 0
    call $~lib/string/String#toLowerCase
    local.get 2
    call $~lib/string/String#toLowerCase
    call $~lib/string/String.__eq
    local.get 1
    select
    if  ;; label = @1
      i32.const 1
      return
    end
    i32.const 0)
  (func $generated/schema/Token#get:usdPrice (type 0) (param i32) (result i32)
    local.get 0
    i32.const 3312
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 0
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 8704
      i32.const 3456
      i32.const 47
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBigDecimal
    end)
  (func $src/v3-pools/mappings/pool/v3-pool-initialize/handleV3PoolInitialize (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    i32.const 8048
    local.get 0
    i32.load
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 8512
      i32.const 8576
      i32.const 9
      i32.const 20
      call $~lib/builtins/abort
      unreachable
    end
    i32.const 6592
    local.get 2
    call $generated/schema/Pool#get:token0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.tee 4
    i32.eqz
    if  ;; label = @1
      i32.const 8512
      i32.const 8576
      i32.const 10
      i32.const 26
      call $~lib/builtins/abort
      unreachable
    end
    i32.const 6592
    local.get 2
    call $generated/schema/Pool#get:token1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.tee 5
    i32.eqz
    if  ;; label = @1
      i32.const 8512
      i32.const 8576
      i32.const 11
      i32.const 26
      call $~lib/builtins/abort
      unreachable
    end
    i32.const 4
    i32.const 46
    call $~lib/rt/stub/__new
    local.tee 3
    i32.const 0
    i32.store
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.load
    i32.load offset=24
    i32.const 0
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
    i32.load offset=4
    local.tee 0
    i32.load
    i32.const 3
    i32.eq
    if (result i32)  ;; label = @1
      i32.const 1
    else
      local.get 0
      i32.load
      i32.const 4
      i32.eq
    end
    i32.eqz
    if  ;; label = @1
      i32.const 8816
      i32.const 8912
      i32.const 85
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64
    local.set 3
    local.get 2
    local.set 0
    block  ;; label = @1
      local.get 1
      i32.const 8
      i32.sub
      i32.load
      i32.const 17
      i32.eq
      if  ;; label = @2
        local.get 1
        i32.load
        local.set 2
        i32.const 16
        i32.const 19
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
        local.get 1
        local.get 3
        i32.store
        local.get 1
        local.get 4
        i32.store offset=4
        local.get 1
        local.get 5
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 2
        local.get 1
        call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#push
        br 1 (;@1;)
      end
      i32.const 2
      call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
      i32.const 192
      call $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.pow
      local.set 1
      local.get 3
      i32.eqz
      if  ;; label = @2
        i32.const 9024
        i32.const 8288
        i32.const 198
        i32.const 5
        call $~lib/builtins/abort
        unreachable
      end
      local.get 3
      local.get 3
      call $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.times
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#toBigDecimal
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
      call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#div
      local.get 4
      call $src/utils/token-utils/tokenBaseAmount
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#toBigDecimal
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#times
      local.get 5
      call $src/utils/token-utils/tokenBaseAmount
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#toBigDecimal
      call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#div
      local.set 2
      block (result i32)  ;; label = @2
        i32.const 9472
        call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
        local.set 3
        global.get $src/utils/constants/ZERO_BIG_DECIMAL
        local.set 1
        local.get 2
        i32.eqz
        if  ;; label = @3
          i32.const 9504
          i32.const 8288
          i32.const 379
          i32.const 5
          call $~lib/builtins/abort
          unreachable
        end
        local.get 2
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.minus
        local.tee 1
        i32.load
        i32.const 0
        call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
        call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.compare
        if (result i32)  ;; label = @3
          i32.const 1
          i32.const -1
          local.get 1
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
        i32.eqz
        if  ;; label = @3
          global.get $src/utils/constants/ZERO_BIG_DECIMAL
          br 1 (;@2;)
        end
        local.get 3
        local.get 2
        call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#div
      end
      local.set 3
      i32.const 8
      i32.const 47
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      i32.const 0
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store
      local.get 1
      local.get 2
      i32.store offset=4
      block  ;; label = @2
        local.get 0
        call $src/utils/pool-utils/isVariableWithStablePool
        if  ;; label = @3
          block (result i32)  ;; label = @4
            local.get 0
            call $src/utils/pool-utils/isStablePool
            if (result i32)  ;; label = @5
              i32.const 1
            else
              local.get 0
              call $src/utils/pool-utils/isVariableWithStablePool
            end
            i32.eqz
            if  ;; label = @5
              i32.const 19792
              i32.const 20144
              i32.const 44
              i32.const 3
              call $~lib/builtins/abort
              unreachable
            end
            call $src/utils/current-network/CurrentNetwork.get:stablecoinsAddresses
            i32.const 20224
            call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/value/Value>#map<~lib/string/String>
            local.get 0
            call $generated/schema/Pool#get:token0
            call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
            call $~lib/string/String#toLowerCase
            call $~lib/array/Array<~lib/string/String>#includes
            if  ;; label = @5
              i32.const 0
              local.get 0
              call $generated/schema/Pool#get:token0
              call $generated/schema/Token#constructor
              br 1 (;@4;)
            end
            i32.const 0
            local.get 0
            call $generated/schema/Pool#get:token1
            call $generated/schema/Token#constructor
          end
          call $generated/schema/Token#get:id@virtual
          local.get 4
          call $generated/schema/Token#get:id@virtual
          call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#equals
          if  ;; label = @4
            local.get 5
            local.get 1
            i32.load
            call $generated/schema/Token#set:usdPrice
            local.get 5
            call $generated/schema/Token#save
            br 2 (;@2;)
          end
          local.get 4
          local.get 1
          i32.load offset=4
          call $generated/schema/Token#set:usdPrice
          local.get 4
          call $generated/schema/Token#save
          br 1 (;@2;)
        end
        local.get 0
        call $src/utils/pool-utils/isWrappedNativePool
        if  ;; label = @3
          block (result i32)  ;; label = @4
            local.get 0
            call $src/utils/pool-utils/isWrappedNativePool
            i32.eqz
            if  ;; label = @5
              i32.const 20368
              i32.const 20144
              i32.const 62
              i32.const 3
              call $~lib/builtins/abort
              unreachable
            end
            local.get 0
            call $generated/schema/Pool#get:token0
            call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
            local.set 2
            call $src/utils/current-network/CurrentNetwork.get:wrappedNativeAddress
            local.set 3
            local.get 2
            call $~lib/string/String#toLowerCase
            local.get 3
            call $~lib/string/String#toLowerCase
            call $~lib/string/String.__eq
            if  ;; label = @5
              i32.const 0
              local.get 0
              call $generated/schema/Pool#get:token0
              call $generated/schema/Token#constructor
              br 1 (;@4;)
            end
            i32.const 0
            local.get 0
            call $generated/schema/Pool#get:token1
            call $generated/schema/Token#constructor
          end
          call $generated/schema/Token#get:id@virtual
          local.get 4
          call $generated/schema/Token#get:id@virtual
          call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#equals
          if  ;; label = @4
            local.get 5
            local.get 1
            i32.load
            local.get 4
            call $generated/schema/Token#get:usdPrice
            call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#times
            call $generated/schema/Token#set:usdPrice
            local.get 5
            call $generated/schema/Token#save
            br 2 (;@2;)
          end
          local.get 4
          local.get 1
          i32.load offset=4
          local.get 5
          call $generated/schema/Token#get:usdPrice
          call $~lib/@graphprotocol/graph-ts/common/numbers/BigDecimal#times
          call $generated/schema/Token#set:usdPrice
          local.get 4
          call $generated/schema/Token#save
          br 1 (;@2;)
        end
        local.get 0
        call $src/utils/pool-utils/isStablePool
        if  ;; label = @3
          local.get 5
          local.get 1
          i32.load
          call $generated/schema/Token#set:usdPrice
          local.get 4
          local.get 1
          i32.load offset=4
          call $generated/schema/Token#set:usdPrice
          local.get 4
          call $generated/schema/Token#save
          local.get 5
          call $generated/schema/Token#save
        end
      end
    end
    local.get 4
    call $generated/schema/Token#save
    local.get 5
    call $generated/schema/Token#save
    local.get 0
    call $generated/schema/Pool#save)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromBoolean (type 0) (param i32) (result i32)
    (local i64)
    local.get 0
    i32.eqz
    i32.eqz
    i64.extend_i32_u
    local.set 1
    i32.const 16
    i32.const 28
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 5
    i32.store
    local.get 0
    local.get 1
    i64.store offset=8
    local.get 0)
  (func $~lib/matchstick-as/assert/assert.assertTrue (type 4) (param i32 i32)
    local.get 1
    if (result i32)  ;; label = @1
      i32.const 1
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromBoolean
      local.get 0
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromBoolean
      local.get 1
      call $~lib/matchstick-as/assert/_assert.equalsWithMessage
    else
      i32.const 1
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromBoolean
      local.get 0
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromBoolean
      call $~lib/matchstick-as/assert/_assert.equals
    end
    i32.eqz
    if  ;; label = @1
      i32.const 20704
      i32.const 20800
      i32.const 156
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end)
  (func $start:tests/v3-pools/mappings/pool/v3-pool-initialize.test~anonymous|0 (type 7)
    (local i32 i32 i32 i32 i32)
    block (result i32)  ;; label = @1
      i32.const 8
      i32.const 17
      call $~lib/rt/stub/__new
      local.tee 0
      i32.eqz
      if  ;; label = @2
        i32.const 0
        i32.const 18
        call $~lib/rt/stub/__new
        local.set 0
      end
      local.get 0
    end
    i32.const 0
    i32.const 22
    i32.const 2928
    call $~lib/rt/__newArray
    i32.store
    local.get 0
    i32.const 0
    i32.const 35
    i32.const 2960
    call $~lib/rt/__newArray
    i32.store offset=4
    local.get 0
    local.set 2
    call $tests/mocks/PoolMock#constructor
    local.set 4
    i32.const 12
    i32.const 44
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
    i32.const 12
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.fromU32
    i32.store offset=4
    local.get 1
    i32.const 0
    i32.store offset=8
    local.get 1
    call $tests/mocks/PoolMock#constructor
    i32.load offset=4
    i32.store
    local.get 1
    local.set 0
    local.get 4
    i32.load offset=4
    local.tee 3
    i32.load offset=8
    i32.const 20
    i32.ne
    if  ;; label = @1
      i32.const 8260
      local.get 3
      i32.load offset=8
      call $~lib/util/number/itoa32
      i32.store
      i32.const 8256
      i32.const 8252
      i32.load
      i32.const 2
      i32.shr_u
      i32.const 2592
      call $~lib/util/string/joinStringArray
      i32.const 8288
      i32.const 45
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    local.get 3
    i32.store
    local.get 1
    call $tests/v3-pools/mappings/pool/v3-pool-initialize.test/createEvent
    local.get 2
    call $src/v3-pools/mappings/pool/v3-pool-initialize/handleV3PoolInitialize
    local.get 2
    i32.load
    i32.load offset=12
    i32.const 0
    i32.gt_s
    i32.const 20560
    call $~lib/matchstick-as/assert/assert.assertTrue
    block (result i32)  ;; label = @1
      local.get 2
      i32.load
      i32.const 0
      call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
      i32.load offset=12
      local.tee 0
      i32.const 8
      i32.sub
      i32.load
      i32.const 37
      i32.eq
      if  ;; label = @2
        local.get 0
        i32.load offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 3104
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
      local.tee 3
      if (result i32)  ;; label = @2
        local.get 3
        i32.load
        i32.const 5
        i32.eq
      else
        i32.const 1
      end
      if (result i32)  ;; label = @2
        i32.const 8704
        i32.const 3456
        i32.const 100
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      else
        local.get 3
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      end
    end
    local.get 4
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#equals
    i32.const 20880
    call $~lib/matchstick-as/assert/assert.assertTrue
    local.get 2
    i32.load
    i32.const 0
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
    i32.load
    local.get 1
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt.compare
    i32.eqz
    i32.const 20944
    call $~lib/matchstick-as/assert/assert.assertTrue
    local.get 2
    i32.load
    i32.const 0
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
    i32.load offset=4
    call $generated/schema/Token#get:id@virtual
    local.get 4
    call $generated/schema/Pool#get:token0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#equals
    i32.const 21024
    call $~lib/matchstick-as/assert/assert.assertTrue
    local.get 2
    i32.load
    i32.const 0
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/common/collections/TypedMapEntry<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>>#__get
    i32.load offset=8
    call $generated/schema/Token#get:id@virtual
    local.get 4
    call $generated/schema/Pool#get:token1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#equals
    i32.const 21120
    call $~lib/matchstick-as/assert/assert.assertTrue)
  (func $node_modules/@graphprotocol/graph-ts/global/global/id_of_type (type 0) (param i32) (result i32)
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
                                                                                                                                                                                                                                                                                                                                            i32.const 50
                                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                          i32.const 51
                                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        i32.const 52
                                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                      i32.const 53
                                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                    i32.const 13
                                                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                  i32.const 54
                                                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                i32.const 55
                                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                              i32.const 56
                                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                            i32.const 57
                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                          i32.const 58
                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                        i32.const 59
                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                      i32.const 61
                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                    i32.const 62
                                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                  i32.const 64
                                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                i32.const 66
                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                              i32.const 68
                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                            i32.const 3
                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                          i32.const 70
                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                        i32.const 72
                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                      i32.const 77
                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                    i32.const 78
                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                  i32.const 79
                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                i32.const 80
                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                              i32.const 81
                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                            i32.const 69
                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                          i32.const 85
                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                        i32.const 86
                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                      i32.const 87
                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                    i32.const 63
                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                  i32.const 65
                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                i32.const 67
                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                              i32.const 88
                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                            i32.const 73
                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                          i32.const 93
                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                        i32.const 74
                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                      i32.const 93
                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                    i32.const 94
                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                  i32.const 97
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
                                                                                                                                                                                                                                                        i32.const 103
                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                      i32.const 104
                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                    i32.const 105
                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                  i32.const 36
                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                i32.const 106
                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                              i32.const 107
                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                            i32.const 108
                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                          i32.const 109
                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                        i32.const 111
                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                      i32.const 91
                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                    i32.const 113
                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                  i32.const 114
                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                i32.const 119
                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                              i32.const 121
                                                                                                                                                                                                                              return
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                            i32.const 123
                                                                                                                                                                                                                            return
                                                                                                                                                                                                                          end
                                                                                                                                                                                                                          i32.const 125
                                                                                                                                                                                                                          return
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                        i32.const 126
                                                                                                                                                                                                                        return
                                                                                                                                                                                                                      end
                                                                                                                                                                                                                      i32.const 112
                                                                                                                                                                                                                      return
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                    i32.const 118
                                                                                                                                                                                                                    return
                                                                                                                                                                                                                  end
                                                                                                                                                                                                                  i32.const 122
                                                                                                                                                                                                                  return
                                                                                                                                                                                                                end
                                                                                                                                                                                                                i32.const 127
                                                                                                                                                                                                                return
                                                                                                                                                                                                              end
                                                                                                                                                                                                              i32.const 128
                                                                                                                                                                                                              return
                                                                                                                                                                                                            end
                                                                                                                                                                                                            i32.const 126
                                                                                                                                                                                                            return
                                                                                                                                                                                                          end
                                                                                                                                                                                                          i32.const 110
                                                                                                                                                                                                          return
                                                                                                                                                                                                        end
                                                                                                                                                                                                        i32.const 129
                                                                                                                                                                                                        return
                                                                                                                                                                                                      end
                                                                                                                                                                                                      i32.const 130
                                                                                                                                                                                                      return
                                                                                                                                                                                                    end
                                                                                                                                                                                                    i32.const 131
                                                                                                                                                                                                    return
                                                                                                                                                                                                  end
                                                                                                                                                                                                  i32.const 132
                                                                                                                                                                                                  return
                                                                                                                                                                                                end
                                                                                                                                                                                                i32.const 133
                                                                                                                                                                                                return
                                                                                                                                                                                              end
                                                                                                                                                                                              i32.const 134
                                                                                                                                                                                              return
                                                                                                                                                                                            end
                                                                                                                                                                                            i32.const 136
                                                                                                                                                                                            return
                                                                                                                                                                                          end
                                                                                                                                                                                          i32.const 137
                                                                                                                                                                                          return
                                                                                                                                                                                        end
                                                                                                                                                                                        i32.const 138
                                                                                                                                                                                        return
                                                                                                                                                                                      end
                                                                                                                                                                                      i32.const 139
                                                                                                                                                                                      return
                                                                                                                                                                                    end
                                                                                                                                                                                    i32.const 115
                                                                                                                                                                                    return
                                                                                                                                                                                  end
                                                                                                                                                                                  i32.const 140
                                                                                                                                                                                  return
                                                                                                                                                                                end
                                                                                                                                                                                i32.const 120
                                                                                                                                                                                return
                                                                                                                                                                              end
                                                                                                                                                                              i32.const 141
                                                                                                                                                                              return
                                                                                                                                                                            end
                                                                                                                                                                            i32.const 117
                                                                                                                                                                            return
                                                                                                                                                                          end
                                                                                                                                                                          i32.const 124
                                                                                                                                                                          return
                                                                                                                                                                        end
                                                                                                                                                                        i32.const 142
                                                                                                                                                                        return
                                                                                                                                                                      end
                                                                                                                                                                      i32.const 143
                                                                                                                                                                      return
                                                                                                                                                                    end
                                                                                                                                                                    i32.const 89
                                                                                                                                                                    return
                                                                                                                                                                  end
                                                                                                                                                                  i32.const 90
                                                                                                                                                                  return
                                                                                                                                                                end
                                                                                                                                                                i32.const 62
                                                                                                                                                                return
                                                                                                                                                              end
                                                                                                                                                              i32.const 92
                                                                                                                                                              return
                                                                                                                                                            end
                                                                                                                                                            i32.const 144
                                                                                                                                                            return
                                                                                                                                                          end
                                                                                                                                                          i32.const 145
                                                                                                                                                          return
                                                                                                                                                        end
                                                                                                                                                        i32.const 91
                                                                                                                                                        return
                                                                                                                                                      end
                                                                                                                                                      i32.const 147
                                                                                                                                                      return
                                                                                                                                                    end
                                                                                                                                                    i32.const 150
                                                                                                                                                    return
                                                                                                                                                  end
                                                                                                                                                  i32.const 154
                                                                                                                                                  return
                                                                                                                                                end
                                                                                                                                                i32.const 153
                                                                                                                                                return
                                                                                                                                              end
                                                                                                                                              i32.const 170
                                                                                                                                              return
                                                                                                                                            end
                                                                                                                                            i32.const 175
                                                                                                                                            return
                                                                                                                                          end
                                                                                                                                          i32.const 177
                                                                                                                                          return
                                                                                                                                        end
                                                                                                                                        i32.const 185
                                                                                                                                        return
                                                                                                                                      end
                                                                                                                                      i32.const 169
                                                                                                                                      return
                                                                                                                                    end
                                                                                                                                    i32.const 187
                                                                                                                                    return
                                                                                                                                  end
                                                                                                                                  i32.const 181
                                                                                                                                  return
                                                                                                                                end
                                                                                                                                i32.const 188
                                                                                                                                return
                                                                                                                              end
                                                                                                                              i32.const 158
                                                                                                                              return
                                                                                                                            end
                                                                                                                            i32.const 36
                                                                                                                            return
                                                                                                                          end
                                                                                                                          i32.const 193
                                                                                                                          return
                                                                                                                        end
                                                                                                                        i32.const 146
                                                                                                                        return
                                                                                                                      end
                                                                                                                      i32.const 165
                                                                                                                      return
                                                                                                                    end
                                                                                                                    i32.const 148
                                                                                                                    return
                                                                                                                  end
                                                                                                                  i32.const 174
                                                                                                                  return
                                                                                                                end
                                                                                                                i32.const 164
                                                                                                                return
                                                                                                              end
                                                                                                              i32.const 192
                                                                                                              return
                                                                                                            end
                                                                                                            i32.const 156
                                                                                                            return
                                                                                                          end
                                                                                                          i32.const 195
                                                                                                          return
                                                                                                        end
                                                                                                        i32.const 151
                                                                                                        return
                                                                                                      end
                                                                                                      i32.const 152
                                                                                                      return
                                                                                                    end
                                                                                                    i32.const 198
                                                                                                    return
                                                                                                  end
                                                                                                  i32.const 157
                                                                                                  return
                                                                                                end
                                                                                                i32.const 155
                                                                                                return
                                                                                              end
                                                                                              i32.const 189
                                                                                              return
                                                                                            end
                                                                                            i32.const 194
                                                                                            return
                                                                                          end
                                                                                          i32.const 182
                                                                                          return
                                                                                        end
                                                                                        i32.const 163
                                                                                        return
                                                                                      end
                                                                                      i32.const 199
                                                                                      return
                                                                                    end
                                                                                    i32.const 161
                                                                                    return
                                                                                  end
                                                                                  i32.const 160
                                                                                  return
                                                                                end
                                                                                i32.const 171
                                                                                return
                                                                              end
                                                                              i32.const 173
                                                                              return
                                                                            end
                                                                            i32.const 172
                                                                            return
                                                                          end
                                                                          i32.const 159
                                                                          return
                                                                        end
                                                                        i32.const 168
                                                                        return
                                                                      end
                                                                      i32.const 190
                                                                      return
                                                                    end
                                                                    i32.const 184
                                                                    return
                                                                  end
                                                                  i32.const 191
                                                                  return
                                                                end
                                                                i32.const 36
                                                                return
                                                              end
                                                              i32.const 162
                                                              return
                                                            end
                                                            i32.const 36
                                                            return
                                                          end
                                                          i32.const 176
                                                          return
                                                        end
                                                        i32.const 149
                                                        return
                                                      end
                                                      i32.const 183
                                                      return
                                                    end
                                                    i32.const 201
                                                    return
                                                  end
                                                  i32.const 179
                                                  return
                                                end
                                                i32.const 180
                                                return
                                              end
                                              i32.const 178
                                              return
                                            end
                                            i32.const 167
                                            return
                                          end
                                          i32.const 196
                                          return
                                        end
                                        i32.const 166
                                        return
                                      end
                                      i32.const 202
                                      return
                                    end
                                    i32.const 186
                                    return
                                  end
                                  i32.const 197
                                  return
                                end
                                i32.const 203
                                return
                              end
                              i32.const 200
                              return
                            end
                            i32.const 204
                            return
                          end
                          i32.const 207
                          return
                        end
                        i32.const 205
                        return
                      end
                      i32.const 206
                      return
                    end
                    i32.const 208
                    return
                  end
                  i32.const 209
                  return
                end
                i32.const 210
                return
              end
              i32.const 211
              return
            end
            i32.const 212
            return
          end
          i32.const 36
          return
        end
        i32.const 213
        return
      end
      i32.const 91
      return
    end
    i32.const 0)
  (func $node_modules/@graphprotocol/graph-ts/global/global/allocate (type 0) (param i32) (result i32)
    local.get 0
    call $~lib/rt/stub/__alloc)
  (func $generated/schema/Token#get:id@virtual (type 0) (param i32) (result i32)
    local.get 0
    i32.const 8
    i32.sub
    i32.load
    i32.const 38
    i32.eq
    if  ;; label = @1
      local.get 0
      i32.load offset=4
      return
    end
    local.get 0
    i32.const 3104
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 0
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 8704
      i32.const 3456
      i32.const 34
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
    end)
  (func $~start (type 7)
    (local i32 i32)
    global.get $~started
    if  ;; label = @1
      return
    end
    i32.const 1
    global.set $~started
    i32.const 21340
    global.set $~lib/rt/stub/offset
    i32.const 0
    call $~lib/rt/stub/__alloc
    drop
    i32.const 4
    i32.const 4
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    drop
    i32.const 1904
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $~lib/matchstick-as/defaults/defaultAddress
    global.get $~lib/matchstick-as/defaults/defaultAddress
    global.set $~lib/matchstick-as/defaults/defaultAddressBytes
    i32.const 1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    global.set $~lib/matchstick-as/defaults/defaultBigInt
    i32.const 1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    global.set $~lib/matchstick-as/defaults/defaultIntBytes
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString
    global.set $src/utils/constants/ZERO_BIG_DECIMAL
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    drop
    i32.const 2624
    call $~lib/@graphprotocol/graph-ts/common/datasource/dataSource.network
    call $~lib/string/String#concat
    local.set 1
    i32.const 12
    i32.const 16
    call $~lib/rt/stub/__new
    local.tee 0
    local.get 1
    i32.store offset=8
    local.get 0
    i32.const 2560
    i32.store
    local.get 0
    i32.const 2592
    i32.store offset=4
    i32.const 2688
    i32.const 0
    i32.const 21216
    i32.load
    call $~lib/matchstick-as/index/_registerTest
    i32.const 0
    call $~lib/rt/stub/__alloc
    drop)
  (table $0 6 funcref)
  (memory (;0;) 1)
  (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/defaults/defaultAddress (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/defaults/defaultAddressBytes (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/defaults/defaultBigInt (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/defaults/defaultIntBytes (mut i32) (i32.const 0))
  (global $src/utils/constants/ZERO_BIG_DECIMAL (mut i32) (i32.const 0))
  (global $~argumentsLength (mut i32) (i32.const 0))
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
  (export "TypeId.String" (global 7))
  (export "TypeId.ArrayBuffer" (global 8))
  (export "TypeId.Int8Array" (global 9))
  (export "TypeId.Int16Array" (global 10))
  (export "TypeId.Int32Array" (global 11))
  (export "TypeId.Int64Array" (global 12))
  (export "TypeId.Uint8Array" (global 13))
  (export "TypeId.Uint16Array" (global 14))
  (export "TypeId.Uint32Array" (global 15))
  (export "TypeId.Uint64Array" (global 16))
  (export "TypeId.Float32Array" (global 17))
  (export "TypeId.Float64Array" (global 18))
  (export "TypeId.BigDecimal" (global 19))
  (export "TypeId.ArrayBool" (global 20))
  (export "TypeId.ArrayUint8Array" (global 21))
  (export "TypeId.ArrayEthereumValue" (global 22))
  (export "TypeId.ArrayStoreValue" (global 23))
  (export "TypeId.ArrayJsonValue" (global 24))
  (export "TypeId.ArrayString" (global 25))
  (export "TypeId.ArrayEventParam" (global 26))
  (export "TypeId.ArrayTypedMapEntryStringJsonValue" (global 27))
  (export "TypeId.ArrayTypedMapEntryStringStoreValue" (global 28))
  (export "TypeId.SmartContractCall" (global 29))
  (export "TypeId.EventParam" (global 30))
  (export "TypeId.EthereumTransaction" (global 31))
  (export "TypeId.EthereumBlock" (global 32))
  (export "TypeId.EthereumCall" (global 33))
  (export "TypeId.WrappedTypedMapStringJsonValue" (global 34))
  (export "TypeId.WrappedBool" (global 35))
  (export "TypeId.WrappedJsonValue" (global 36))
  (export "TypeId.EthereumValue" (global 37))
  (export "TypeId.StoreValue" (global 38))
  (export "TypeId.JsonValue" (global 39))
  (export "TypeId.EthereumEvent" (global 40))
  (export "TypeId.TypedMapEntryStringStoreValue" (global 41))
  (export "TypeId.TypedMapEntryStringJsonValue" (global 42))
  (export "TypeId.TypedMapStringStoreValue" (global 43))
  (export "TypeId.TypedMapStringJsonValue" (global 44))
  (export "TypeId.TypedMapStringTypedMapStringJsonValue" (global 45))
  (export "TypeId.ResultTypedMapStringJsonValueBool" (global 46))
  (export "TypeId.ResultJsonValueBool" (global 47))
  (export "TypeId.ArrayU8" (global 48))
  (export "TypeId.ArrayU16" (global 49))
  (export "TypeId.ArrayU32" (global 50))
  (export "TypeId.ArrayU64" (global 51))
  (export "TypeId.ArrayI8" (global 52))
  (export "TypeId.ArrayI16" (global 53))
  (export "TypeId.ArrayI32" (global 54))
  (export "TypeId.ArrayI64" (global 55))
  (export "TypeId.ArrayF32" (global 56))
  (export "TypeId.ArrayF64" (global 57))
  (export "TypeId.ArrayBigDecimal" (global 58))
  (export "TypeId.NearArrayDataReceiver" (global 59))
  (export "TypeId.NearArrayCryptoHash" (global 60))
  (export "TypeId.NearArrayActionValue" (global 61))
  (export "TypeId.NearMerklePath" (global 62))
  (export "TypeId.NearArrayValidatorStake" (global 63))
  (export "TypeId.NearArraySlashedValidator" (global 64))
  (export "TypeId.NearArraySignature" (global 65))
  (export "TypeId.NearArrayChunkHeader" (global 66))
  (export "TypeId.NearAccessKeyPermissionValue" (global 67))
  (export "TypeId.NearActionValue" (global 68))
  (export "TypeId.NearDirection" (global 69))
  (export "TypeId.NearPublicKey" (global 70))
  (export "TypeId.NearSignature" (global 71))
  (export "TypeId.NearFunctionCallPermission" (global 72))
  (export "TypeId.NearFullAccessPermission" (global 73))
  (export "TypeId.NearAccessKey" (global 74))
  (export "TypeId.NearDataReceiver" (global 75))
  (export "TypeId.NearCreateAccountAction" (global 76))
  (export "TypeId.NearDeployContractAction" (global 77))
  (export "TypeId.NearFunctionCallAction" (global 78))
  (export "TypeId.NearTransferAction" (global 79))
  (export "TypeId.NearStakeAction" (global 80))
  (export "TypeId.NearAddKeyAction" (global 81))
  (export "TypeId.NearDeleteKeyAction" (global 82))
  (export "TypeId.NearDeleteAccountAction" (global 83))
  (export "TypeId.NearActionReceipt" (global 84))
  (export "TypeId.NearSuccessStatus" (global 85))
  (export "TypeId.NearMerklePathItem" (global 86))
  (export "TypeId.NearExecutionOutcome" (global 87))
  (export "TypeId.NearSlashedValidator" (global 88))
  (export "TypeId.NearBlockHeader" (global 89))
  (export "TypeId.NearValidatorStake" (global 90))
  (export "TypeId.NearChunkHeader" (global 91))
  (export "TypeId.NearBlock" (global 92))
  (export "TypeId.NearReceiptWithOutcome" (global 93))
  (export "TypeId.TransactionReceipt" (global 94))
  (export "TypeId.Log" (global 95))
  (export "TypeId.ArrayH256" (global 96))
  (export "TypeId.ArrayLog" (global 97))
  (export "TypeId.CosmosAny" (global 98))
  (export "TypeId.CosmosAnyArray" (global 99))
  (export "TypeId.CosmosBytesArray" (global 100))
  (export "TypeId.CosmosCoinArray" (global 101))
  (export "TypeId.CosmosCommitSigArray" (global 102))
  (export "TypeId.CosmosEventArray" (global 103))
  (export "TypeId.CosmosEventAttributeArray" (global 104))
  (export "TypeId.CosmosEvidenceArray" (global 105))
  (export "TypeId.CosmosModeInfoArray" (global 106))
  (export "TypeId.CosmosSignerInfoArray" (global 107))
  (export "TypeId.CosmosTxResultArray" (global 108))
  (export "TypeId.CosmosValidatorArray" (global 109))
  (export "TypeId.CosmosValidatorUpdateArray" (global 110))
  (export "TypeId.CosmosAuthInfo" (global 111))
  (export "TypeId.CosmosBlock" (global 112))
  (export "TypeId.CosmosBlockId" (global 113))
  (export "TypeId.CosmosBlockIdFlagEnum" (global 114))
  (export "TypeId.CosmosBlockParams" (global 115))
  (export "TypeId.CosmosCoin" (global 116))
  (export "TypeId.CosmosCommit" (global 117))
  (export "TypeId.CosmosCommitSig" (global 118))
  (export "TypeId.CosmosCompactBitArray" (global 119))
  (export "TypeId.CosmosConsensus" (global 120))
  (export "TypeId.CosmosConsensusParams" (global 121))
  (export "TypeId.CosmosDuplicateVoteEvidence" (global 122))
  (export "TypeId.CosmosDuration" (global 123))
  (export "TypeId.CosmosEvent" (global 124))
  (export "TypeId.CosmosEventAttribute" (global 125))
  (export "TypeId.CosmosEventData" (global 126))
  (export "TypeId.CosmosEventVote" (global 127))
  (export "TypeId.CosmosEvidence" (global 128))
  (export "TypeId.CosmosEvidenceList" (global 129))
  (export "TypeId.CosmosEvidenceParams" (global 130))
  (export "TypeId.CosmosFee" (global 131))
  (export "TypeId.CosmosHeader" (global 132))
  (export "TypeId.CosmosHeaderOnlyBlock" (global 133))
  (export "TypeId.CosmosLightBlock" (global 134))
  (export "TypeId.CosmosLightClientAttackEvidence" (global 135))
  (export "TypeId.CosmosModeInfo" (global 136))
  (export "TypeId.CosmosModeInfoMulti" (global 137))
  (export "TypeId.CosmosModeInfoSingle" (global 138))
  (export "TypeId.CosmosPartSetHeader" (global 139))
  (export "TypeId.CosmosPublicKey" (global 140))
  (export "TypeId.CosmosResponseBeginBlock" (global 141))
  (export "TypeId.CosmosResponseDeliverTx" (global 142))
  (export "TypeId.CosmosResponseEndBlock" (global 143))
  (export "TypeId.CosmosSignModeEnum" (global 144))
  (export "TypeId.CosmosSignedHeader" (global 145))
  (export "TypeId.CosmosSignedMsgTypeEnum" (global 146))
  (export "TypeId.CosmosSignerInfo" (global 147))
  (export "TypeId.CosmosTimestamp" (global 148))
  (export "TypeId.CosmosTip" (global 149))
  (export "TypeId.CosmosTransactionData" (global 150))
  (export "TypeId.CosmosTx" (global 151))
  (export "TypeId.CosmosTxBody" (global 152))
  (export "TypeId.CosmosTxResult" (global 153))
  (export "TypeId.CosmosValidator" (global 154))
  (export "TypeId.CosmosValidatorParams" (global 155))
  (export "TypeId.CosmosValidatorSet" (global 156))
  (export "TypeId.CosmosValidatorSetUpdates" (global 157))
  (export "TypeId.CosmosValidatorUpdate" (global 158))
  (export "TypeId.CosmosVersionParams" (global 159))
  (export "TypeId.CosmosMessageData" (global 160))
  (export "TypeId.CosmosTransactionContext" (global 161))
  (export "TypeId.ArweaveBlock" (global 162))
  (export "TypeId.ArweaveProofOfAccess" (global 163))
  (export "TypeId.ArweaveTag" (global 164))
  (export "TypeId.ArweaveTagArray" (global 165))
  (export "TypeId.ArweaveTransaction" (global 166))
  (export "TypeId.ArweaveTransactionArray" (global 167))
  (export "TypeId.ArweaveTransactionWithBlockPtr" (global 168))
  (export "TypeId.StarknetBlock" (global 169))
  (export "TypeId.StarknetTransaction" (global 170))
  (export "TypeId.StarknetTransactionTypeEnum" (global 171))
  (export "TypeId.StarknetEvent" (global 172))
  (export "TypeId.StarknetArrayBytes" (global 173))
  (export "id_of_type" (func $node_modules/@graphprotocol/graph-ts/global/global/id_of_type))
  (export "allocate" (func $node_modules/@graphprotocol/graph-ts/global/global/allocate))
  (export "memory" (memory 0))
  (export "table" (table 0))
  (export "_start" (func $~start))
  (elem $0 (i32.const 1) func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData~anonymous|0 $src/utils/pool-utils/isVariableWithStablePool~anonymous|0 $src/utils/pool-utils/isVariableWithStablePool~anonymous|0 $src/utils/pool-utils/isVariableWithStablePool~anonymous|0 $start:tests/v3-pools/mappings/pool/v3-pool-initialize.test~anonymous|0)
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
  (data (;54;) (i32.const 2540) "\1c")
  (data (;55;) (i32.const 2552) "\01\00\00\00\0a\00\00\00E\00r\00r\00o\00r")
  (data (;56;) (i32.const 2572) "\1c")
  (data (;57;) (i32.const 2584) "\01")
  (data (;58;) (i32.const 2604) "<")
  (data (;59;) (i32.const 2616) "\01\00\00\00*\00\00\00U\00n\00s\00u\00p\00p\00o\00r\00t\00e\00d\00 \00n\00e\00t\00w\00o\00r\00k\00:\00 ")
  (data (;60;) (i32.const 2668) "\ec")
  (data (;61;) (i32.const 2680) "\01\00\00\00\d8\00\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00h\00a\00n\00d\00l\00e\00r\00 \00i\00s\00 \00c\00a\00l\00l\00e\00d\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00c\00a\00l\00l\00 \00'\00s\00e\00t\00P\00r\00i\00c\00e\00s\00F\00o\00r\00V\003\00P\00o\00o\00l\00W\00h\00i\00t\00e\00l\00i\00s\00t\00e\00d\00T\00o\00k\00e\00n\00s\00'\00\0a\00 \00 \00 \00 \00w\00i\00t\00h\00 \00t\00h\00e\00 \00c\00o\00r\00r\00e\00c\00t\00 \00p\00a\00r\00a\00m\00s")
  (data (;62;) (i32.const 2908) "\1c")
  (data (;63;) (i32.const 2940) "\1c")
  (data (;64;) (i32.const 2972) "l")
  (data (;65;) (i32.const 2984) "\01\00\00\00T\00\00\000\00x\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\001")
  (data (;66;) (i32.const 3084) "\1c")
  (data (;67;) (i32.const 3096) "\01\00\00\00\04\00\00\00i\00d")
  (data (;68;) (i32.const 3116) "|")
  (data (;69;) (i32.const 3128) "\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
  (data (;70;) (i32.const 3244) ",")
  (data (;71;) (i32.const 3256) "\01\00\00\00\10\00\00\00d\00e\00c\00i\00m\00a\00l\00s")
  (data (;72;) (i32.const 3292) ",")
  (data (;73;) (i32.const 3304) "\01\00\00\00\10\00\00\00u\00s\00d\00P\00r\00i\00c\00e")
  (data (;74;) (i32.const 3340) "\5c")
  (data (;75;) (i32.const 3352) "\01\00\00\00L\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00T\00o\00k\00e\00n\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;76;) (i32.const 3436) "<")
  (data (;77;) (i32.const 3448) "\01\00\00\00&\00\00\00g\00e\00n\00e\00r\00a\00t\00e\00d\00/\00s\00c\00h\00e\00m\00a\00.\00t\00s")
  (data (;78;) (i32.const 3500) "\9c")
  (data (;79;) (i32.const 3512) "\01\00\00\00\82\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00T\00o\00k\00e\00n\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00B\00y\00t\00e\00s\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;80;) (i32.const 3660) ",")
  (data (;81;) (i32.const 3672) "\01\00\00\00\1a\00\00\00'\00 \00i\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 ")
  (data (;82;) (i32.const 3708) ",")
  (data (;83;) (i32.const 3720) "'\00\00\00\14\00\00\00\c0\0d\00\00\00\00\00\00`\0e\00\00\00\00\00\00 \0a")
  (data (;84;) (i32.const 3756) "<")
  (data (;85;) (i32.const 3768) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00s\00t\00r\00i\00n\00g\00.")
  (data (;86;) (i32.const 3820) "l")
  (data (;87;) (i32.const 3832) "\01\00\00\00X\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00v\00a\00l\00u\00e\00.\00t\00s")
  (data (;88;) (i32.const 3932) "<")
  (data (;89;) (i32.const 3944) "\01\00\00\00(\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\003\002\00.")
  (data (;90;) (i32.const 3996) "|")
  (data (;91;) (i32.const 4008) "\01\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
  (data (;92;) (i32.const 4124) "<")
  (data (;93;) (i32.const 4136) "\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
  (data (;94;) (i32.const 4188) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
  (data (;95;) (i32.const 4588) "\1c\04")
  (data (;96;) (i32.const 4600) "\01\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
  (data (;97;) (i32.const 5644) "\5c")
  (data (;98;) (i32.const 5656) "\01\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
  (data (;99;) (i32.const 5740) "<")
  (data (;100;) (i32.const 5752) "\01\00\00\00(\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\006\004\00.")
  (data (;101;) (i32.const 5804) "L")
  (data (;102;) (i32.const 5816) "\01\00\00\004\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00.")
  (data (;103;) (i32.const 5884) "L")
  (data (;104;) (i32.const 5896) "\01\00\00\00.\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00b\00o\00o\00l\00e\00a\00n\00.")
  (data (;105;) (i32.const 5964) "\1c")
  (data (;106;) (i32.const 5976) "\01\00\00\00\08\00\00\00t\00r\00u\00e")
  (data (;107;) (i32.const 5996) "\1c")
  (data (;108;) (i32.const 6008) "\01\00\00\00\0a\00\00\00f\00a\00l\00s\00e")
  (data (;109;) (i32.const 6028) "<")
  (data (;110;) (i32.const 6040) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00a\00r\00r\00a\00y\00.")
  (data (;111;) (i32.const 6092) "\1c")
  (data (;112;) (i32.const 6104) "\01\00\00\00\02\00\00\00[")
  (data (;113;) (i32.const 6124) "\1c")
  (data (;114;) (i32.const 6136) ")\00\00\00\08\00\00\00\01")
  (data (;115;) (i32.const 6156) "\1c")
  (data (;116;) (i32.const 6168) "\01\00\00\00\04\00\00\00,\00 ")
  (data (;117;) (i32.const 6188) "\1c")
  (data (;118;) (i32.const 6200) "\01\00\00\00\02\00\00\00]")
  (data (;119;) (i32.const 6220) "L")
  (data (;120;) (i32.const 6232) "\01\00\00\004\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00b\00y\00t\00e\00 \00a\00r\00r\00a\00y\00.")
  (data (;121;) (i32.const 6300) "<")
  (data (;122;) (i32.const 6312) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00B\00i\00g\00I\00n\00t\00.")
  (data (;123;) (i32.const 6364) "<")
  (data (;124;) (i32.const 6376) "\01\00\00\00*\00\00\00U\00n\00k\00n\00o\00w\00n\00 \00d\00a\00t\00a\00 \00(\00k\00i\00n\00d\00 \00=\00 ")
  (data (;125;) (i32.const 6428) "\1c")
  (data (;126;) (i32.const 6440) "\01\00\00\00\02\00\00\00)")
  (data (;127;) (i32.const 6460) "\1c")
  (data (;128;) (i32.const 6472) "'\00\00\00\0c\00\00\00\f0\18\00\00\00\00\00\000\19")
  (data (;129;) (i32.const 6492) ",")
  (data (;130;) (i32.const 6504) "\01\00\00\00\12\00\00\00U\00n\00k\00n\00o\00w\00n\00 \00(")
  (data (;131;) (i32.const 6540) "\1c")
  (data (;132;) (i32.const 6552) "'\00\00\00\0c\00\00\00p\19\00\00\00\00\00\000\19")
  (data (;133;) (i32.const 6572) "\1c")
  (data (;134;) (i32.const 6584) "\01\00\00\00\0a\00\00\00T\00o\00k\00e\00n")
  (data (;135;) (i32.const 6604) "\1c")
  (data (;136;) (i32.const 6616) "\01\00\00\00\0c\00\00\00t\00o\00k\00e\00n\000")
  (data (;137;) (i32.const 6636) "\1c")
  (data (;138;) (i32.const 6648) "\01\00\00\00\0c\00\00\00t\00o\00k\00e\00n\001")
  (data (;139;) (i32.const 6668) ",")
  (data (;140;) (i32.const 6680) "\01\00\00\00\0e\00\00\00f\00e\00e\00T\00i\00e\00r")
  (data (;141;) (i32.const 6716) ",")
  (data (;142;) (i32.const 6728) "\01\00\00\00\16\00\00\00t\00i\00c\00k\00S\00p\00a\00c\00i\00n\00g")
  (data (;143;) (i32.const 6764) "<")
  (data (;144;) (i32.const 6776) "\01\00\00\00&\00\00\00t\00o\00t\00a\00l\00V\00a\00l\00u\00e\00L\00o\00c\00k\00e\00d\00U\00S\00D")
  (data (;145;) (i32.const 6828) "<")
  (data (;146;) (i32.const 6840) "\01\00\00\00,\00\00\00t\00o\00t\00a\00l\00V\00a\00l\00u\00e\00L\00o\00c\00k\00e\00d\00T\00o\00k\00e\00n\000")
  (data (;147;) (i32.const 6892) "<")
  (data (;148;) (i32.const 6904) "\01\00\00\00,\00\00\00t\00o\00t\00a\00l\00V\00a\00l\00u\00e\00L\00o\00c\00k\00e\00d\00T\00o\00k\00e\00n\001")
  (data (;149;) (i32.const 6956) "<")
  (data (;150;) (i32.const 6968) "\01\00\00\00$\00\00\00c\00r\00e\00a\00t\00e\00d\00A\00t\00T\00i\00m\00e\00s\00t\00a\00m\00p")
  (data (;151;) (i32.const 7020) ",")
  (data (;152;) (i32.const 7032) "\01\00\00\00\1a\00\00\00m\00o\00c\00k\00-\00p\00r\00o\00t\00o\00c\00o\00l")
  (data (;153;) (i32.const 7068) ",")
  (data (;154;) (i32.const 7080) "\01\00\00\00\1a\00\00\00M\00o\00c\00k\00 \00P\00r\00o\00t\00o\00c\00o\00l")
  (data (;155;) (i32.const 7116) "\1c")
  (data (;156;) (i32.const 7128) "\01\00\00\00\08\00\00\00n\00a\00m\00e")
  (data (;157;) (i32.const 7148) ",")
  (data (;158;) (i32.const 7160) "\01\00\00\00\12\00\00\00m\00o\00c\00k\00-\00l\00o\00g\00o")
  (data (;159;) (i32.const 7196) "\1c")
  (data (;160;) (i32.const 7208) "\01\00\00\00\08\00\00\00l\00o\00g\00o")
  (data (;161;) (i32.const 7228) ",")
  (data (;162;) (i32.const 7240) "\01\00\00\00\10\00\00\00m\00o\00c\00k\00-\00u\00r\00l")
  (data (;163;) (i32.const 7276) "\1c")
  (data (;164;) (i32.const 7288) "\01\00\00\00\06\00\00\00u\00r\00l")
  (data (;165;) (i32.const 7308) "l")
  (data (;166;) (i32.const 7320) "\01\00\00\00R\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00P\00r\00o\00t\00o\00c\00o\00l\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;167;) (i32.const 7420) "\9c")
  (data (;168;) (i32.const 7432) "\01\00\00\00\8a\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00P\00r\00o\00t\00o\00c\00o\00l\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00S\00t\00r\00i\00n\00g\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;169;) (i32.const 7580) ",")
  (data (;170;) (i32.const 7592) "'\00\00\00\14\00\00\00\10\1d\00\00\00\00\00\00`\0e\00\00\00\00\00\00 \0a")
  (data (;171;) (i32.const 7628) ",")
  (data (;172;) (i32.const 7640) "\01\00\00\00\10\00\00\00P\00r\00o\00t\00o\00c\00o\00l")
  (data (;173;) (i32.const 7676) ",")
  (data (;174;) (i32.const 7688) "\01\00\00\00\10\00\00\00p\00r\00o\00t\00o\00c\00o\00l")
  (data (;175;) (i32.const 7724) "\5c")
  (data (;176;) (i32.const 7736) "\01\00\00\00J\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00P\00o\00o\00l\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;177;) (i32.const 7820) "\9c")
  (data (;178;) (i32.const 7832) "\01\00\00\00\80\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00P\00o\00o\00l\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00B\00y\00t\00e\00s\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;179;) (i32.const 7980) ",")
  (data (;180;) (i32.const 7992) "'\00\00\00\14\00\00\00\a0\1e\00\00\00\00\00\00`\0e\00\00\00\00\00\00 \0a")
  (data (;181;) (i32.const 8028) "\1c")
  (data (;182;) (i32.const 8040) "\01\00\00\00\08\00\00\00P\00o\00o\00l")
  (data (;183;) (i32.const 8060) "<")
  (data (;184;) (i32.const 8072) "\01\00\00\00 \00\00\00B\00y\00t\00e\00s\00 \00o\00f\00 \00l\00e\00n\00g\00t\00h\00 ")
  (data (;185;) (i32.const 8124) "l")
  (data (;186;) (i32.const 8136) "\01\00\00\00T\00\00\00 \00c\00a\00n\00 \00n\00o\00t\00 \00b\00e\00 \00c\00o\00n\00v\00e\00r\00t\00e\00d\00 \00t\00o\00 \002\000\00 \00b\00y\00t\00e\00 \00a\00d\00d\00r\00e\00s\00s\00e\00s")
  (data (;187;) (i32.const 8236) "\1c")
  (data (;188;) (i32.const 8248) "'\00\00\00\0c\00\00\00\90\1f\00\00\00\00\00\00\d0\1f")
  (data (;189;) (i32.const 8268) "l")
  (data (;190;) (i32.const 8280) "\01\00\00\00\5c\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00n\00u\00m\00b\00e\00r\00s\00.\00t\00s")
  (data (;191;) (i32.const 8380) "\1c")
  (data (;192;) (i32.const 8412) ",")
  (data (;193;) (i32.const 8424) "\01\00\00\00\18\00\00\00s\00q\00r\00t\00P\00r\00i\00c\00e\00X\009\006")
  (data (;194;) (i32.const 8460) "\1c")
  (data (;195;) (i32.const 8472) "\01\00\00\00\08\00\00\00t\00i\00c\00k")
  (data (;196;) (i32.const 8492) "<")
  (data (;197;) (i32.const 8504) "\01\00\00\00\1e\00\00\00u\00n\00e\00x\00p\00e\00c\00t\00e\00d\00 \00n\00u\00l\00l")
  (data (;198;) (i32.const 8556) "|")
  (data (;199;) (i32.const 8568) "\01\00\00\00`\00\00\00s\00r\00c\00/\00v\003\00-\00p\00o\00o\00l\00s\00/\00m\00a\00p\00p\00i\00n\00g\00s\00/\00p\00o\00o\00l\00/\00v\003\00-\00p\00o\00o\00l\00-\00i\00n\00i\00t\00i\00a\00l\00i\00z\00e\00.\00t\00s")
  (data (;200;) (i32.const 8684) "l")
  (data (;201;) (i32.const 8696) "\01\00\00\00P\00\00\00C\00a\00n\00n\00o\00t\00 \00r\00e\00t\00u\00r\00n\00 \00n\00u\00l\00l\00 \00f\00o\00r\00 \00a\00 \00r\00e\00q\00u\00i\00r\00e\00d\00 \00f\00i\00e\00l\00d\00.")
  (data (;202;) (i32.const 8796) "\5c")
  (data (;203;) (i32.const 8808) "\01\00\00\00J\00\00\00E\00t\00h\00e\00r\00e\00u\00m\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\00n\00t\00 \00o\00r\00 \00u\00i\00n\00t\00.")
  (data (;204;) (i32.const 8892) "l")
  (data (;205;) (i32.const 8904) "\01\00\00\00\5c\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00h\00a\00i\00n\00/\00e\00t\00h\00e\00r\00e\00u\00m\00.\00t\00s")
  (data (;206;) (i32.const 9004) "\8c")
  (data (;207;) (i32.const 9016) "\01\00\00\00v\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00m\00u\00l\00t\00i\00p\00l\00y\00 \00B\00i\00g\00I\00n\00t\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;208;) (i32.const 9148) "\8c")
  (data (;209;) (i32.const 9160) "\01\00\00\00z\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00d\00i\00v\00i\00d\00e\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;210;) (i32.const 9292) "\9c")
  (data (;211;) (i32.const 9304) "\01\00\00\00~\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00m\00u\00l\00t\00i\00p\00l\00y\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;212;) (i32.const 9452) "\1c")
  (data (;213;) (i32.const 9464) "\01\00\00\00\02\00\00\001")
  (data (;214;) (i32.const 9484) "\9c")
  (data (;215;) (i32.const 9496) "\01\00\00\00~\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00s\00u\00b\00t\00r\00a\00c\00t\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;216;) (i32.const 9644) "l")
  (data (;217;) (i32.const 9656) "\01\00\00\00T\00\00\000\00x\00d\00a\00c\001\007\00f\009\005\008\00d\002\00e\00e\005\002\003\00a\002\002\000\006\002\000\006\009\009\004\005\009\007\00c\001\003\00d\008\003\001\00e\00c\007")
  (data (;218;) (i32.const 9756) "l")
  (data (;219;) (i32.const 9768) "\01\00\00\00T\00\00\000\00x\00a\000\00b\008\006\009\009\001\00c\006\002\001\008\00b\003\006\00c\001\00d\001\009\00d\004\00a\002\00e\009\00e\00b\000\00c\00e\003\006\000\006\00e\00b\004\008")
  (data (;220;) (i32.const 9868) "l")
  (data (;221;) (i32.const 9880) "\01\00\00\00T\00\00\000\00x\00d\00C\000\003\005\00D\004\005\00d\009\007\003\00E\003\00E\00C\001\006\009\00d\002\002\007\006\00D\00D\00a\00b\001\006\00f\001\00e\004\000\007\003\008\004\00F")
  (data (;222;) (i32.const 9980) "l")
  (data (;223;) (i32.const 9992) "\01\00\00\00T\00\00\000\00x\004\00c\009\00e\00d\00d\005\008\005\002\00c\00d\009\000\005\00f\000\008\006\00c\007\005\009\00e\008\003\008\003\00e\000\009\00b\00f\00f\001\00e\006\008\00b\003")
  (data (;224;) (i32.const 10092) "l")
  (data (;225;) (i32.const 10104) "\01\00\00\00T\00\00\000\00x\00c\005\00f\000\00f\007\00b\006\006\007\006\004\00F\006\00e\00c\008\00C\008\00D\00f\00f\007\00B\00A\006\008\003\001\000\002\002\009\005\00E\001\006\004\000\009")
  (data (;226;) (i32.const 10204) "l")
  (data (;227;) (i32.const 10216) "\01\00\00\00T\00\00\000\00x\006\00c\003\00e\00a\009\000\003\006\004\000\006\008\005\002\000\000\006\002\009\000\007\007\000\00b\00e\00d\00f\00c\00a\00b\00a\000\00e\002\003\00a\000\00e\008")
  (data (;228;) (i32.const 10316) ",")
  (data (;229;) (i32.const 10332) "\18\00\00\00\c0%\00\000&\00\00\a0&\00\00\10'\00\00\80'\00\00\f0'")
  (data (;230;) (i32.const 10364) "L")
  (data (;231;) (i32.const 10376) "\01\00\00\008\00\00\00s\00r\00c\00/\00u\00t\00i\00l\00s\00/\00c\00u\00r\00r\00e\00n\00t\00-\00n\00e\00t\00w\00o\00r\00k\00.\00t\00s")
  (data (;232;) (i32.const 10445) "\01\02\03\04\05\06\07\08\09\0a\0b\0c\0d\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\22#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\5c]^_`abcdefghijklmnopqrstuvwxyz{|}~\7f")
  (data (;233;) (i32.const 10572) "\12\10\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\10\10\22\10\10\10#$%&'()\10*+\10\10\10\10\10\10\10\10\10\10\10,-.\10/\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\100\10\10\101\10234567\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\108\10\109:\10;<=\10\10\10\10\10\10>\10\10?@ABCDEFGHIJKL\10MNO\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10P\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10QR\10\10\10S\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10T\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10UV\10\10\10\10\10\10\10W\10\10\10\10\10XYZ\10\10\10\10\10[\5c\10\10\10\10\10\10\10\10\10]\10\10\10\10\10\10\10\10\10\10\10\10")
  (data (;234;) (i32.const 11116) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\80@\00\04\00\00\00@\01\00\00\00\00\00\00\00\00\a1\90\01")
  (data (;235;) (i32.const 11202) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff0\04\b0")
  (data (;236;) (i32.const 11260) "\f8\03")
  (data (;237;) (i32.const 11287) "\82\00\00\00\00\00\00\fe\ff\ff\ff\ff\bf\b6\00\00\00\00\00\10\00?\00\ff\17\00\00\00\00\01\f8\ff\ff\00\00\01")
  (data (;238;) (i32.const 11334) "\c0\bf\ff=\00\00\00\80\02\00\00\00\ff\ff\ff\07")
  (data (;239;) (i32.const 11360) "\c0\ff\01\00\00\00\00\00\00\f8?$\00\00\c0\ff\ff?\00\00\00\00\00\0e")
  (data (;240;) (i32.const 11398) "\f8\ff\ff\ff\ff\ff\07\00\00\00\00\00\00\14\fe!\fe\00\0c\00\02\00\02\00\00\00\00\00\00\10\1e \00\00\0c\00\00@\06\00\00\00\00\00\00\10\869\02\00\00\00#\00\06\00\00\00\00\00\00\10\be!\00\00\0c\00\00\fc\02\00\00\00\00\00\00\90\1e `\00\0c\00\00\00\04\00\00\00\00\00\00\00\01 \00\00\00\00\00\00\11\00\00\00\00\00\00\c0\c1=`\00\0c\00\00\00\02\00\00\00\00\00\00\90@0\00\00\0c\00\00\00\03\00\00\00\00\00\00\18\1e \00\00\0c\00\00\00\02\00\00\00\00\00\00\00\00\04\5c")
  (data (;241;) (i32.const 11570) "\f2\07\c0\7f")
  (data (;242;) (i32.const 11586) "\f2\1f@?")
  (data (;243;) (i32.const 11599) "\03\00\00\a0\02\00\00\00\00\00\00\fe\7f\df\e0\ff\fe\ff\ff\ff\1f@")
  (data (;244;) (i32.const 11633) "\e0\fdf\00\00\00\c3\01\00\1e\00d \00 ")
  (data (;245;) (i32.const 11659) "\10")
  (data (;246;) (i32.const 11671) "\e0")
  (data (;247;) (i32.const 11694) "\1c\00\00\00\1c\00\00\00\0c\00\00\00\0c\00\00\00\00\00\00\00\b0?@\fe\8f \00\00\00\00\00x\00\00\00\00\00\00\08\00\00\00\00\00\00\00`\00\00\00\00\02")
  (data (;248;) (i32.const 11760) "\87\01\04\0e")
  (data (;249;) (i32.const 11790) "\80\09\00\00\00\00\00\00@\7f\e5\1f\f8\9f\00\00\00\00\80\00\ff\ff\01\00\00\00\00\00\00\00\0f\00\00\00\00\00\d0\17\04\00\00\00\00\f8\0f\00\03\00\00\00<;\00\00\00\00\00\00@\a3\03\00\00\00\00\00\00\f0\cf\00\00\00\00\00\00\00\00?")
  (data (;250;) (i32.const 11878) "\f7\ff\fd!\10\03\00\00\00\00\00\f0\ff\ff\ff\ff\ff\ff\ff\07\00\01\00\00\00\f8\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\fb")
  (data (;251;) (i32.const 11939) "\a0\03\e0\00\e0\00\e0\00`\00\f8\00\03\90|\00\00\00\00\00\00\df\ff\02\80\00\00\ff\1f\00\00\00\00\00\00\ff\ff\ff\ff\01")
  (data (;252;) (i32.const 11995) "0")
  (data (;253;) (i32.const 12009) "\80\03")
  (data (;254;) (i32.const 12025) "\80\00\80")
  (data (;255;) (i32.const 12040) "\ff\ff\ff\ff\00\00\00\00\00\80")
  (data (;256;) (i32.const 12076) " \00\00\00\00<>\08")
  (data (;257;) (i32.const 12095) "~")
  (data (;258;) (i32.const 12107) "p\00\00 ")
  (data (;259;) (i32.const 12171) "?\00\10")
  (data (;260;) (i32.const 12185) "\80\f7\bf\00\00\00\f0")
  (data (;261;) (i32.const 12202) "\03\00\ff\ff\ff\ff\03")
  (data (;262;) (i32.const 12218) "\01\00\00\07")
  (data (;263;) (i32.const 12235) "\03D\08\00\00`\10")
  (data (;264;) (i32.const 12260) "0\00\00\00\ff\ff\03\80\00\00\00\00\c0?\00\00\80\ff\03\00\00\00\00\00\07\00\00\00\00\00\c83\00\80\00\00`\00\00\00\00\00\00\00\00~f\00\08\10\00\00\00\00\01\10\00\00\00\00\00\00\9d\c1\02\00\00 \000X")
  (data (;265;) (i32.const 12343) "\f8\00\0e")
  (data (;266;) (i32.const 12360) " !\00\00\00\00\00@")
  (data (;267;) (i32.const 12386) "\fc\ff\03\00\00\00\00\00\00\00\ff\ff\08\00\ff\ff\00\00\00\00$")
  (data (;268;) (i32.const 12427) "\80\80@\00\04\00\00\00@\01\00\00\00\00\00\01\00\00\00\00\c0\00\00\00\00\00\00\00\00\08\00\00\0e")
  (data (;269;) (i32.const 12491) " ")
  (data (;270;) (i32.const 12520) "\01")
  (data (;271;) (i32.const 12538) "\c0\07")
  (data (;272;) (i32.const 12556) "n\f0\00\00\00\00\00\87")
  (data (;273;) (i32.const 12584) "`\00\00\00\00\00\00\00\f0")
  (data (;274;) (i32.const 12641) "\18")
  (data (;275;) (i32.const 12660) "\c0\ff\01")
  (data (;276;) (i32.const 12684) "\02\00\00\00\00\00\00\ff\7f\00\00\00\00\00\00\80\03\00\00\00\00\00x&\00 \00\00\00\00\00\00\07\00\00\00\80\ef\1f\00\00\00\00\00\00\00\08\00\03\00\00\00\00\00\c0\7f\00\9e")
  (data (;277;) (i32.const 12753) "\80\d3@")
  (data (;278;) (i32.const 12775) "\80\f8\07\00\00\03\00\00\00\00\00\00\18\01\00\00\00\c0\1f\1f")
  (data (;279;) (i32.const 12819) "\ff\5c\00\00@")
  (data (;280;) (i32.const 12834) "\f8\85\0d")
  (data (;281;) (i32.const 12866) "<\b0\01\00\000")
  (data (;282;) (i32.const 12882) "\f8\a7\01")
  (data (;283;) (i32.const 12897) "(\bf")
  (data (;284;) (i32.const 12911) "\e0\bc\0f")
  (data (;285;) (i32.const 12945) "\80\ff\06")
  (data (;286;) (i32.const 12979) "X\08")
  (data (;287;) (i32.const 12998) "\f0\0c\01\00\00\00\fe\07\00\00\00\00\f8y\80\00~\0e\00\00\00\00\00\fc\7f\03")
  (data (;288;) (i32.const 13042) "\7f\bf")
  (data (;289;) (i32.const 13054) "\fc\ff\ff\fcm")
  (data (;290;) (i32.const 13074) "~\b4\bf")
  (data (;291;) (i32.const 13086) "\a3")
  (data (;292;) (i32.const 13130) "\18\00\00\00\00\00\00\00\ff\01")
  (data (;293;) (i32.const 13194) "\1f\00\00\00\00\00\00\00\7f\00\0f")
  (data (;294;) (i32.const 13237) "\80\00\00\00\00\00\00\00\80\ff\ff\00\00\00\00\00\00\00\00\1b")
  (data (;295;) (i32.const 13279) "`\0f")
  (data (;296;) (i32.const 13304) "\80\03\f8\ff\e7\0f\00\00\00<")
  (data (;297;) (i32.const 13332) "\1c")
  (data (;298;) (i32.const 13356) "\ff\ff\ff\ff\ff\ff\7f\f8\ff\ff\ff\ff\ff\1f \00\10\00\00\f8\fe\ff")
  (data (;299;) (i32.const 13388) "\7f\ff\ff\f9\db\07")
  (data (;300;) (i32.const 13426) "\ff?")
  (data (;301;) (i32.const 13481) "\f0")
  (data (;302;) (i32.const 13510) "\7f")
  (data (;303;) (i32.const 13524) "\f0\0f")
  (data (;304;) (i32.const 13579) "\f8")
  (data (;305;) (i32.const 13580) "\12\13\14\15\16\17\10\10\10\10\10\10\10\10\10\10\18\10\10\19\10\10\10\10\10\10\10\10\1a\1b\11\1c\1d\1e\10\10\1f\10\10\10\10\10\10\10 !\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\22#\10\10\10$\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10%\10\10\10&\10\10\10\10'\10\10\10\10\10\10\10(\10\10\10\10\10\10\10\10\10\10\10)\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10*\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10+,-.\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10\10/\10\10\10\10\10\10\100\10\10\10\10\10\10\10\10\10\10\10\10\10\10")
  (data (;306;) (i32.const 14124) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\fe\ff\ff\07\fe\ff\ff\07\00\00\00\00\00\04 \04\ff\ff\7f\ff\ff\ff\7f\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\f7\f0\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ef\ff\ff\ff\ff\01\03\00\00\00\1f")
  (data (;307;) (i32.const 14260) " \00\00\00\00\00\cf\bc@\d7\ff\ff\fb\ff\ff\ff\ff\ff\ff\ff\ff\ff\bf\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\03\fc\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\fe\ff\ff\ff\7f\00\ff\ff\ff\ff\ff\01")
  (data (;308;) (i32.const 14368) "\ff\ff\ff\ff\bf \ff\ff\ff\ff\ff\e7")
  (data (;309;) (i32.const 14400) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff??")
  (data (;310;) (i32.const 14428) "\ff\01\ff\ff\ff\ff\ff\e7\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\ff\ff??\ff\ff\ff\ff??\ff\aa\ff\ff\ff?\ff\ff\ff\ff\ff\ff\df_\dc\1f\cf\0f\ff\1f\dc\1f")
  (data (;311;) (i32.const 14522) "\02\80\00\00\ff\1f")
  (data (;312;) (i32.const 14540) "\84\fc/>P\bd\1f\f2\e0C\00\00\ff\ff\ff\ff\18")
  (data (;313;) (i32.const 14594) "\c0\ff\ff\ff\ff\ff\ff\03\00\00\ff\ff\ff\ff\ff\7f\ff\ff\ff\ff\ff\7f\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\1fx\0c\00\ff\ff\ff\ff\bf ")
  (data (;314;) (i32.const 14676) "\ff\ff\ff\ff\ff?\00\00\ff\ff\ff?")
  (data (;315;) (i32.const 14704) "\fc\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ffx\ff\ff\ff\ff\ff\ff\fc\07\00\00\00\00`\07\00\00\00\00\00\00\ff\ff\ff\ff\ff\f7\ff\01\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\7f\00\f8")
  (data (;316;) (i32.const 14800) "\fe\ff\ff\07\fe\ff\ff\07")
  (data (;317;) (i32.const 14828) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff")
  (data (;318;) (i32.const 14850) "\ff\ff\ff\ff\0f\ff\ff\ff\ff\0f")
  (data (;319;) (i32.const 14876) "\ff\ff\ff\ff\ff\ff\07\00\ff\ff\ff\ff\ff\ff\07")
  (data (;320;) (i32.const 14912) "\ff\ff\ff\ff\ff\ff\ff\ff")
  (data (;321;) (i32.const 14932) "\ff\ff\ff\ff\ff\ff\ff\ff")
  (data (;322;) (i32.const 14956) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\df\ff\ff\ff\ff\ff\ff\ff\ff\dfd\de\ff\eb\ef\ff\ff\ff\ff\ff\ff\ff\bf\e7\df\df\ff\ff\ff{_\fc\fd\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff?\ff\ff\ff\fd\ff\ff\f7\ff\ff\ff\f7\ff\ff\df\ff\ff\ff\df\ff\ff\7f\ff\ff\ff\7f\ff\ff\ff\fd\ff\ff\ff\fd\ff\ff\f7\0f\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\0f")
  (data (;323;) (i32.const 15122) "\ff\ff\ff\03\ff\ff\ff\03\ff\ff\ff\03")
  (data (;324;) (i32.const 15148) "\07\08\09\0a\0b\0c\06\06\06\06\06\06\06\06\06\06\0d\06\06\0e\06\06\06\06\06\06\06\06\0f\10\11\12\06\13\06\06\06\06\06\06\06\06\06\06\14\15\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\16\17\06\06\06\18\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\19\06\06\06\06\1a\06\06\06\06\06\06\06\1b\06\06\06\06\06\06\06\06\06\06\06\1c\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\1d\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\1e\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06")
  (data (;325;) (i32.const 15771) "$++++++++\01\00TVVVVVVVV")
  (data (;326;) (i32.const 15810) "\18\00\00\00+++++++\07++[VVVVVVVJVV\051P1P1P1P1P1P1P1P$Py1P1P18P1P1P1P1P1P1P1PN1\02N\0d\0dN\03N\00$n\00N1&nQN$PN9\14\81\1b\1d\1dS1P1P\0d1P1P1P\1bS$P1\02\5c{\5c{\5c{\5c{\5c{\14y\5c{\5c{\5c-+I\03H\03x\5c{\14\00\96\0a\01+(\06\06\00*\06**+\07\bb\b5+\1e\00+\07+++\01++++++++++++++++++++++++++++++++\01+++++++++++++++++++++++*+++++++++++++\cdF\cd+\00%+\07\01\06\01UVVVVVUVV\02$\81\81\81\81\81\15\81\81\81\00\00+\00\b2\d1\b2\d1\b2\d1\b2\d1\00\00\cd\cc\01\00\d7\d7\d7\d7\d7\83\81\81\81\81\81\81\81\81\81\81\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\1c\00\00\00\00\001P1P1P1P1P1\02\00\001P1P1P1P1P1P1P1P1PN1P1PN1P1P1P1P1P1P1P1\02\87\a6\87\a6\87\a6\87\a6\87\a6\87\a6\87\a6\87\a6*++++++++++++\00\00\00TVVVVVVVVVVVV")
  (data (;327;) (i32.const 16319) "TVVVVVVVVVVVV\0c\00\0c*+++++++++++++\07*\01")
  (data (;328;) (i32.const 16405) "*++++++++++++++++++++++++++VVl\81\15\00++++++++++++++++++++++++++++++++++++++++++\07l\03A++VVVVVVVVVVVVVV,V+++++++++++++++++++++\01")
  (data (;329;) (i32.const 16564) "\0cl\00\00\00\00\00\06")
  (data (;330;) (i32.const 16610) "\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%Vz\9e&\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06%\06\01++OVV,+\7fVV9++UVV++OVV,+\7fVV\817u[{\5c++OVV\02\ac\04\00\009++UVV++OVV,++VV2\13\81W\00o\81~\c9\d7~-\81\81\0e~9\7foW\00\81\81~\15\00~\03++++++++++++\07+$+\97+++++++++*+++++VVVVV\80\81\81\81\819\bb*++++++++++++++++++++++++++++++++++++++++\01\81\81\81\81\81\81\81\81\81\81\81\81\81\81\81\c9\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\ac\d0\0d\00N1\02\b4\c1\c1\d7\d7$P1P1P1P1P1P1P1P1P1P1P1P1P1P1P1P1P\d7\d7S\c1G\d4\d7\d7\d7\05++++++++++++\07\01\00\01")
  (data (;331;) (i32.const 17061) "N1P1P1P1P1P1P1P\0d\00\00\00\00\00$P1P1P1P1P")
  (data (;332;) (i32.const 17126) "+++++++++++y\5c{\5c{O{\5c{\5c{\5c{\5c{\5c{\5c{\5c{\5c{\5c{\5c-++y\14\5c{\5c-y*\5c'\5c{\5c{\5c{\a4\00\0a\b4\5c{\5c{O\03x8+++++++++++++O-++\01")
  (data (;333;) (i32.const 17239) "H")
  (data (;334;) (i32.const 17249) "*++++++++++++++++++++++++++")
  (data (;335;) (i32.const 17309) "++++++++\07\00HVVVVVVVV\02")
  (data (;336;) (i32.const 17384) "+++++++++++++UVVVVVVVVVVVV\0e")
  (data (;337;) (i32.const 17442) "$+++++++++++\07\00VVVVVVVVVVVV")
  (data (;338;) (i32.const 17512) "$++++++++++++++++\07\00\00\00\00VVVVVVVVVVVVVVVVV")
  (data (;339;) (i32.const 17609) "*++++++++++VVVVVVVVVV\0e")
  (data (;340;) (i32.const 17663) "*++++++++++VVVVVVVVVV\0e")
  (data (;341;) (i32.const 17728) "+++++++++++UVVVVVVVVVV\0e")
  (data (;342;) (i32.const 17817) "\08\00\00V\01\00\009")
  (data (;343;) (i32.const 17832) "\01 \00\00\00\e0\ff\ff\00\bf\1d\00\00\e7\02\00\00y\00\00\02$\00\00\01\01\00\00\00\ff\ff\ff\00\00\00\00\01\02\00\00\00\fe\ff\ff\019\ff\ff\00\18\ff\ff\01\87\ff\ff\00\d4\fe\ff\00\c3\00\00\01\d2\00\00\01\ce\00\00\01\cd\00\00\01O\00\00\01\ca\00\00\01\cb\00\00\01\cf\00\00\00a\00\00\01\d3\00\00\01\d1\00\00\00\a3\00\00\01\d5\00\00\00\82\00\00\01\d6\00\00\01\da\00\00\01\d9\00\00\01\db\00\00\008\00\00\03\00\00\00\00\b1\ff\ff\01\9f\ff\ff\01\c8\ff\ff\02($\00\00\00\00\00\01\01\00\00\00\ff\ff\ff\003\ff\ff\00&\ff\ff\01~\ff\ff\01+*\00\01]\ff\ff\01(*\00\00?*\00\01=\ff\ff\01E\00\00\01G\00\00\00\1f*\00\00\1c*\00\00\1e*\00\00.\ff\ff\002\ff\ff\006\ff\ff\005\ff\ff\00O\a5\00\00K\a5\00\001\ff\ff\00(\a5\00\00D\a5\00\00/\ff\ff\00-\ff\ff\00\f7)\00\00A\a5\00\00\fd)\00\00+\ff\ff\00*\ff\ff\00\e7)\00\00C\a5\00\00*\a5\00\00\bb\ff\ff\00'\ff\ff\00\b9\ff\ff\00%\ff\ff\00\15\a5\00\00\12\a5\00\02$L\00\00\00\00\00\01 \00\00\00\e0\ff\ff\01\01\00\00\00\ff\ff\ff\00T\00\00\01t\00\00\01&\00\00\01%\00\00\01@\00\00\01?\00\00\00\da\ff\ff\00\db\ff\ff\00\e1\ff\ff\00\c0\ff\ff\00\c1\ff\ff\01\08\00\00\00\c2\ff\ff\00\c7\ff\ff\00\d1\ff\ff\00\ca\ff\ff\00\f8\ff\ff\00\aa\ff\ff\00\b0\ff\ff\00\07\00\00\00\8c\ff\ff\01\c4\ff\ff\00\a0\ff\ff\01\f9\ff\ff\02\1ap\00\01\01\00\00\00\ff\ff\ff\01 \00\00\00\e0\ff\ff\01P\00\00\01\0f\00\00\00\f1\ff\ff\00\00\00\00\010\00\00\00\d0\ff\ff\01\01\00\00\00\ff\ff\ff\00\00\00\00\00\c0\0b\00\01`\1c\00\00\00\00\00\01\d0\97\00\01\08\00\00\00\f8\ff\ff\02\05\8a\00\00\00\00\00\01@\f4\ff\00\9e\e7\ff\00\c2\89\00\00\db\e7\ff\00\92\e7\ff\00\93\e7\ff\00\9c\e7\ff\00\9d\e7\ff\00\a4\e7\ff\00\00\00\00\008\8a\00\00\04\8a\00\00\e6\0e\00\01\01\00\00\00\ff\ff\ff\00\00\00\00\00\c5\ff\ff\01A\e2\ff\02\1d\8f\00\00\08\00\00\01\f8\ff\ff\00\00\00\00\00V\00\00\01\aa\ff\ff\00J\00\00\00d\00\00\00\80\00\00\00p\00\00\00~\00\00\00\09\00\00\01\b6\ff\ff\01\f7\ff\ff\00\db\e3\ff\01\9c\ff\ff\01\90\ff\ff\01\80\ff\ff\01\82\ff\ff\02\05\ac\00\00\00\00\00\01\10\00\00\00\f0\ff\ff\01\1c\00\00\01\01\00\00\01\a3\e2\ff\01A\df\ff\01\ba\df\ff\00\e4\ff\ff\02\0b\b1\00\01\01\00\00\00\ff\ff\ff\010\00\00\00\d0\ff\ff\00\00\00\00\01\09\d6\ff\01\1a\f1\ff\01\19\d6\ff\00\d5\d5\ff\00\d8\d5\ff\01\e4\d5\ff\01\03\d6\ff\01\e1\d5\ff\01\e2\d5\ff\01\c1\d5\ff\00\00\00\00\00\a0\e3\ff\00\00\00\00\01\01\00\00\00\ff\ff\ff\02\0c\bc\00\00\00\00\00\01\01\00\00\00\ff\ff\ff\01\bcZ\ff\01\a0\03\00\01\fcu\ff\01\d8Z\ff\000\00\00\01\b1Z\ff\01\b5Z\ff\01\bfZ\ff\01\eeZ\ff\01\d6Z\ff\01\ebZ\ff\01\d0\ff\ff\01\bdZ\ff\01\c8u\ff\00\00\00\00\000h\ff\00`\fc\ff\00\00\00\00\01 \00\00\00\e0\ff\ff\00\00\00\00\01(\00\00\00\d8\ff\ff\00\00\00\00\01@\00\00\00\c0\ff\ff\00\00\00\00\01 \00\00\00\e0\ff\ff\00\00\00\00\01 \00\00\00\e0\ff\ff\00\00\00\00\01\22\00\00\00\de\ff\ff")
  (data (;344;) (i32.const 18789) "\06'Qow")
  (data (;345;) (i32.const 18804) "|\00\00\7f\00\00\00\00\00\00\00\00\83\8e\92\97\00\aa")
  (data (;346;) (i32.const 18832) "\b4\c4")
  (data (;347;) (i32.const 18954) "\c6\c9\00\00\00\db")
  (data (;348;) (i32.const 19043) "\de\00\00\00\00\e1\00\00\00\00\00\00\00\e4")
  (data (;349;) (i32.const 19068) "\e7")
  (data (;350;) (i32.const 19154) "\ea")
  (data (;351;) (i32.const 19277) "\ed")
  (data (;352;) (i32.const 19300) "0\0c1\0dx\0e\7f\0f\80\10\81\11\86\12\89\13\8a\13\8e\14\8f\15\90\16\93\13\94\17\95\18\96\19\97\1a\9a\1b\9c\19\9d\1c\9e\1d\9f\1e\a6\1f\a9\1f\ae\1f\b1 \b2 \b7!\bf\22\c5#\c8#\cb#\dd$\f2#\f6%\f7& -:.=/>0?1@1C2D3E4P5Q6R7S8T9Y:[;\5c<a=c>e?f@hAiBj@kClDoBqErFuG}H\82I\87J\89K\8aL\8bL\8cM\92N\9dO\9ePEW{\1d|\1d}\1d\7fX\86Y\88Z\89Z\8aZ\8c[\8e\5c\8f\5c\ac]\ad^\ae^\af^\c2_\cc`\cda\cea\cfb\d0c\d1d\d5e\d6f\d7g\f0h\f1i\f2j\f3k\f4l\f5m\f9n\fd-\fe-\ff-PiQiRiSiTiUiViWiXiYiZi[i\5ci]i^i_i\82\00\83\00\84\00\85\00\86\00\87\00\88\00\89\00\c0u\cfv\80\89\81\8a\82\8b\85\8c\86\8dp\9dq\9dv\9ew\9ex\9fy\9fz\a0{\a0|\a1}\a1\b3\a2\ba\a3\bb\a3\bc\a4\be\a5\c3\a2\cc\a4\da\a6\db\a6\e5j\ea\a7\eb\a7\ecn\f3\a2\f8\a8\f9\a8\fa\a9\fb\a9\fc\a4&\b0*\b1+\b2N\b3\84\08b\bac\bbd\bce\bdf\bem\bfn\c0o\c1p\c2~\c3\7f\c3}\cf\8d\d0\94\d1\ab\d2\ac\d3\ad\d4\b0\d5\b1\d6\b2\d7\c4\d8\c5\d9\c6\da")
  (data (;353;) (i32.const 19708) "\1c")
  (data (;354;) (i32.const 19720) "0\00\00\00\08\00\00\00\02")
  (data (;355;) (i32.const 19740) "\1c")
  (data (;356;) (i32.const 19752) "0\00\00\00\08\00\00\00\03")
  (data (;357;) (i32.const 19772) "\5c\01")
  (data (;358;) (i32.const 19784) "\01\00\00\00>\01\00\00N\00o\00 \00m\00a\00p\00p\00e\00d\00 \00s\00t\00a\00b\00l\00e\00c\00o\00i\00n\00 \00t\00o\00k\00e\00n\00 \00f\00o\00u\00n\00d\00 \00i\00n\00 \00t\00h\00e\00 \00p\00o\00o\00l\00;\00 \00\0a\00 \00 \00 \00 \00m\00a\00y\00b\00e\00 \00i\00t\00'\00s\00 \00a\00 \00b\00u\00g\00?\00;\00\0a\00 \00 \00 \00 \00m\00a\00y\00b\00e\00 \00t\00h\00e\00 \00s\00t\00a\00b\00l\00e\00c\00o\00i\00n\00 \00h\00a\00v\00e\00 \00n\00o\00t\00 \00b\00e\00e\00n\00 \00a\00d\00d\00e\00d\00 \00a\00t\00 \00t\00h\00e\00 \00n\00e\00t\00w\00o\00r\00k\00 \00w\00h\00i\00t\00e\00l\00i\00s\00t\00e\00d\00 \00s\00t\00a\00b\00l\00e\00c\00o\00i\00n\00s\00 \00l\00i\00s\00t\00?")
  (data (;359;) (i32.const 20124) "L")
  (data (;360;) (i32.const 20136) "\01\00\00\00.\00\00\00s\00r\00c\00/\00u\00t\00i\00l\00s\00/\00p\00o\00o\00l\00-\00u\00t\00i\00l\00s\00.\00t\00s")
  (data (;361;) (i32.const 20204) "\1c")
  (data (;362;) (i32.const 20216) "0\00\00\00\08\00\00\00\04")
  (data (;363;) (i32.const 20236) "l")
  (data (;364;) (i32.const 20248) "\01\00\00\00T\00\00\000\00x\00c\000\002\00a\00a\00a\003\009\00b\002\002\003\00f\00e\008\00d\000\00a\000\00e\005\00c\004\00f\002\007\00e\00a\00d\009\000\008\003\00c\007\005\006\00c\00c\002")
  (data (;365;) (i32.const 20348) "\bc")
  (data (;366;) (i32.const 20360) "\01\00\00\00\a0\00\00\00P\00o\00o\00l\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00w\00r\00a\00p\00p\00e\00d\00 \00n\00a\00t\00i\00v\00e\00 \00a\00s\00s\00e\00t\00,\00 \00n\00o\00 \00w\00r\00a\00p\00p\00e\00d\00 \00n\00a\00t\00i\00v\00e\00 \00t\00o\00k\00e\00n\00 \00c\00a\00n\00 \00b\00e\00 \00f\00o\00u\00n\00d")
  (data (;367;) (i32.const 20540) "\8c")
  (data (;368;) (i32.const 20552) "\01\00\00\00p\00\00\00s\00e\00t\00P\00r\00i\00c\00e\00s\00F\00o\00r\00V\003\00P\00o\00o\00l\00W\00h\00i\00t\00e\00l\00i\00s\00t\00e\00d\00T\00o\00k\00e\00n\00s\00 \00h\00a\00v\00e\00 \00n\00o\00t\00 \00b\00e\00e\00n\00 \00c\00a\00l\00l\00e\00d")
  (data (;369;) (i32.const 20684) "\5c")
  (data (;370;) (i32.const 20696) "\01\00\00\00B\00\00\00a\00s\00s\00e\00r\00t\00.\00a\00s\00s\00e\00r\00t\00T\00r\00u\00e\00 \00A\00s\00s\00e\00r\00t\00i\00o\00n\00 \00E\00r\00r\00o\00r")
  (data (;371;) (i32.const 20780) "L")
  (data (;372;) (i32.const 20792) "\01\00\00\008\00\00\00~\00l\00i\00b\00/\00m\00a\00t\00c\00h\00s\00t\00i\00c\00k\00-\00a\00s\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s")
  (data (;373;) (i32.const 20860) "<")
  (data (;374;) (i32.const 20872) "\01\00\00\00(\00\00\00p\00o\00o\00l\00 \00i\00s\00 \00n\00o\00t\00 \00t\00h\00e\00 \00s\00a\00m\00e")
  (data (;375;) (i32.const 20924) "L")
  (data (;376;) (i32.const 20936) "\01\00\00\008\00\00\00s\00q\00r\00t\00P\00r\00i\00c\00e\00X\009\006\00 \00i\00s\00 \00n\00o\00t\00 \00t\00h\00e\00 \00s\00a\00m\00e")
  (data (;377;) (i32.const 21004) "\5c")
  (data (;378;) (i32.const 21016) "\01\00\00\00@\00\00\00p\00o\00o\00l\00T\00o\00k\00e\00n\000\00E\00n\00t\00i\00t\00y\00 \00i\00s\00 \00n\00o\00t\00 \00t\00h\00e\00 \00s\00a\00m\00e")
  (data (;379;) (i32.const 21100) "\5c")
  (data (;380;) (i32.const 21112) "\01\00\00\00@\00\00\00p\00o\00o\00l\00T\00o\00k\00e\00n\001\00E\00n\00t\00i\00t\00y\00 \00i\00s\00 \00n\00o\00t\00 \00t\00h\00e\00 \00s\00a\00m\00e")
  (data (;381;) (i32.const 21196) "\1c")
  (data (;382;) (i32.const 21208) "1\00\00\00\08\00\00\00\05")
  (data (;383;) (i32.const 21228) "<")
  (data (;384;) (i32.const 21244) "(\00\00\00\a0\04\00\00\c0\04\00\00\e0\04\00\00\10\05\00\000\05\00\00P\05\00\00p\05\00\00\90\05\00\00\b0\05\00\00\d0\05")
  (data (;385;) (i32.const 21292) ",")
  (data (;386;) (i32.const 21304) "\03\00\00\00\10\00\00\00\00S\00\00\00S\00\00(\00\00\00\0a"))
