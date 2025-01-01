(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func (param i32 i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;10;) (func (result i32)))
  (type (;11;) (func (param i64) (result i32)))
  (type (;12;) (func (param i32 i32 i32 i32) (result i32)))
  (import "env" "abort" (func $~lib/builtins/abort (type 7)))
  (import "conversion" "typeConversion.stringToH160" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160 (type 0)))
  (import "numbers" "bigDecimal.fromString" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.fromString (type 0)))
  (import "store" "clearStore" (func $~lib/matchstick-as/store/clearStore (type 4)))
  (import "index" "_registerHook" (func $~lib/matchstick-as/index/_registerHook (type 1)))
  (import "index" "mockFunction" (func $~lib/matchstick-as/index/mockFunction (type 9)))
  (import "log" "log.log" (func $~lib/matchstick-as/log/log.log (type 1)))
  (import "conversion" "typeConversion.bytesToHex" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex (type 0)))
  (import "index" "store.get" (func $~lib/@graphprotocol/graph-ts/index/store.get (type 2)))
  (import "ethereum" "ethereum.call" (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.call (type 0)))
  (import "datasource" "dataSource.create" (func $~lib/@graphprotocol/graph-ts/common/datasource/dataSource.create (type 1)))
  (import "numbers" "bigDecimal.toString" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.toString (type 0)))
  (import "conversion" "typeConversion.bigIntToString" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString (type 0)))
  (import "index" "store.set" (func $~lib/@graphprotocol/graph-ts/index/store.set (type 3)))
  (import "assert" "_assert.fieldEquals" (func $~lib/matchstick-as/assert/_assert.fieldEquals (type 12)))
  (import "index" "_registerTest" (func $~lib/matchstick-as/index/_registerTest (type 3)))
  (import "index" "_registerDescribe" (func $~lib/matchstick-as/index/_registerDescribe (type 1)))
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
  (func $~lib/rt/stub/__new (type 2) (param i32 i32) (result i32)
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
  (func $~lib/memory/memory.fill (type 1) (param i32 i32)
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
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor (type 0) (param i32) (result i32)
    (local i32)
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        block (result i32)  ;; label = @3
          local.get 0
          i32.eqz
          if  ;; label = @4
            i32.const 12
            i32.const 12
            call $~lib/rt/stub/__new
            local.set 0
          end
          local.get 0
        end
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
    i32.const 4
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 4
    call $~lib/memory/memory.fill
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 4
    i32.store offset=8
    local.get 0)
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
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32 (type 0) (param i32) (result i32)
    (local i32)
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor
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
  (func $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0~anonymous|0 (type 4)
    call $~lib/matchstick-as/store/clearStore)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor (type 8) (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    block (result i32)  ;; label = @1
      local.get 0
      i32.eqz
      if  ;; label = @2
        i32.const 32
        i32.const 19
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
  (func $~lib/util/memory/memcpy (type 3) (param i32 i32 i32)
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
  (func $~lib/memory/memory.copy (type 3) (param i32 i32 i32)
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
  (func $~lib/rt/__newArray (type 5) (param i32 i32 i32) (result i32)
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
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress (type 0) (param i32) (result i32)
    (local i64)
    local.get 0
    i32.load offset=8
    i32.const 20
    i32.ne
    if  ;; label = @1
      i32.const 3152
      i32.const 3248
      i32.const 295
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.extend_i32_u
    local.set 1
    i32.const 16
    i32.const 23
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    local.get 1
    i64.store offset=8
    local.get 0)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromI32 (type 0) (param i32) (result i32)
    (local i64)
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 1
    i32.const 16
    i32.const 23
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 3
    i32.store
    local.get 0
    local.get 1
    i64.store offset=8
    local.get 0)
  (func $~lib/matchstick-as/index/createMockedFunction (type 0) (param i32) (result i32)
    (local i32)
    i32.const 20
    i32.const 31
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store8
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
    i32.const 0
    i32.const 32
    i32.const 3616
    call $~lib/rt/__newArray
    i32.store offset=16
    local.get 1
    local.get 0
    i32.store offset=4
    local.get 1
    i32.const 3504
    i32.store offset=8
    local.get 1
    i32.const 3552
    i32.store offset=12
    local.get 1)
  (func $~lib/string/String#concat (type 2) (param i32 i32) (result i32)
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
      i32.const 3680
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
  (func $~lib/array/Array<~lib/string/String>#__get (type 2) (param i32 i32) (result i32)
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
      i32.const 3888
      i32.const 1856
      i32.const 110
      i32.const 40
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0)
  (func $~lib/matchstick-as/index/MockedFunction#returns (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load8_u
    if  ;; label = @1
      i32.const 0
      i32.const 3
      i32.const 3648
      call $~lib/rt/__newArray
      local.set 4
      i32.const 0
      local.set 0
      i32.const 0
      local.set 1
      i32.const 3680
      local.set 3
      i32.const 2268
      i32.load
      i32.const 1
      i32.shr_u
      local.set 5
      loop  ;; label = @2
        local.get 0
        local.get 5
        i32.lt_s
        if  ;; label = @3
          local.get 0
          local.get 5
          i32.const 1
          i32.sub
          i32.lt_s
          if (result i32)  ;; label = @4
            local.get 0
            i32.const 2268
            i32.load
            i32.const 1
            i32.shr_u
            i32.ge_u
            if (result i32)  ;; label = @5
              i32.const -1
            else
              local.get 0
              i32.const 1
              i32.shl
              i32.const 2272
              i32.add
              i32.load16_u
            end
            i32.const 123
            i32.eq
          else
            i32.const 0
          end
          if (result i32)  ;; label = @4
            local.get 0
            i32.const 1
            i32.add
            local.tee 2
            i32.const 2268
            i32.load
            i32.const 1
            i32.shr_u
            i32.ge_u
            if (result i32)  ;; label = @5
              i32.const -1
            else
              local.get 2
              i32.const 1
              i32.shl
              i32.const 2272
              i32.add
              i32.load16_u
            end
            i32.const 125
            i32.eq
          else
            i32.const 0
          end
          if  ;; label = @4
            local.get 1
            local.get 4
            i32.load offset=12
            i32.ge_s
            if (result i32)  ;; label = @5
              i32.const 3712
              i32.const 2272
              call $~lib/string/String#concat
              i32.const 3808
              i32.const 48
              i32.const 9
              call $~lib/builtins/abort
              unreachable
            else
              local.get 1
              local.tee 2
              i32.const 1
              i32.add
              local.set 1
              local.get 3
              local.get 4
              local.get 2
              call $~lib/array/Array<~lib/string/String>#__get
              call $~lib/string/String#concat
              local.set 3
              local.get 0
              i32.const 1
              i32.add
            end
            local.set 0
          else
            i32.const 3680
            local.set 2
            local.get 0
            i32.const 2268
            i32.load
            i32.const 1
            i32.shr_u
            i32.lt_u
            if  ;; label = @5
              i32.const 2
              i32.const 1
              call $~lib/rt/stub/__new
              local.tee 2
              local.get 0
              i32.const 1
              i32.shl
              i32.const 2272
              i32.add
              i32.load16_u
              i32.store16
            end
            local.get 3
            local.get 2
            call $~lib/string/String#concat
            local.set 3
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
      i32.const 0
      local.get 3
      call $~lib/matchstick-as/log/log.log
    else
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=12
      local.get 0
      i32.load offset=16
      local.get 1
      i32.const 0
      call $~lib/matchstick-as/index/mockFunction
      local.get 0
      i32.const 1
      i32.store8
    end)
  (func $tests/event-creators/createPoolCreatedEvent (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 2
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 1
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 8
    i32.const 60
    i32.const 20
    call $~lib/rt/stub/__new
    local.tee 3
    local.get 1
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 8
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    local.get 1
    i32.store offset=20
    local.get 3
    local.get 1
    i32.store offset=24
    local.get 3
    local.get 2
    i32.store offset=28
    local.get 3
    local.get 2
    i32.store offset=32
    local.get 3
    local.get 2
    i32.store offset=36
    local.get 3
    local.get 2
    i32.store offset=40
    local.get 3
    local.get 2
    i32.store offset=44
    local.get 3
    local.get 2
    i32.store offset=48
    local.get 3
    local.get 2
    i32.store offset=52
    local.get 3
    local.get 2
    i32.store offset=56
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 1
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 6
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 5
    i32.const 36
    i32.const 21
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
    i32.const 24
    i32.const 3088
    call $~lib/rt/__newArray
    local.set 13
    global.get $~lib/matchstick-as/defaults/defaultAddressBytes
    local.set 9
    global.get $~lib/matchstick-as/defaults/defaultBigInt
    local.set 6
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 14
    i32.const 1
    i32.const 29
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 10
    i32.load offset=4
    drop
    global.get $~lib/matchstick-as/defaults/defaultAddress
    local.set 15
    i32.const 1
    i32.const 27
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
    i32.const 28
    call $~lib/rt/stub/__new
    local.tee 12
    i32.const 0
    i32.store8
    local.get 12
    i32.const 0
    i32.store8
    i32.const 44
    i32.const 26
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
    i32.const 25
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
    local.get 2
    local.get 2
    i32.const 2208
    local.get 3
    local.get 4
    local.get 13
    local.get 1
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor
    local.set 3
    i32.const 5
    i32.const 24
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 1
    i32.load offset=4
    drop
    local.get 0
    i32.load
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 4
    i32.const 8
    i32.const 22
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3120
    i32.store
    local.get 2
    local.get 4
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store
    local.get 0
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 4
    i32.const 8
    i32.const 22
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3360
    i32.store
    local.get 2
    local.get 4
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=4
    local.get 0
    i32.load offset=8
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromI32
    local.set 4
    i32.const 8
    i32.const 22
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3392
    i32.store
    local.get 2
    local.get 4
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=8
    local.get 0
    i32.load offset=12
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromI32
    local.set 4
    i32.const 8
    i32.const 22
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3424
    i32.store
    local.get 2
    local.get 4
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=12
    local.get 0
    i32.load offset=16
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 4
    i32.const 8
    i32.const 22
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3472
    i32.store
    local.get 2
    local.get 4
    i32.store offset=4
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=16
    local.get 3
    i32.load
    local.set 2
    local.get 3
    i32.load offset=4
    local.set 4
    local.get 3
    i32.load offset=8
    local.set 6
    local.get 3
    i32.load offset=12
    local.set 5
    local.get 3
    i32.load offset=16
    local.set 7
    local.get 3
    i32.load offset=20
    local.set 8
    local.get 3
    i32.load offset=28
    local.set 3
    i32.const 32
    i32.const 18
    call $~lib/rt/stub/__new
    local.get 2
    local.get 4
    local.get 6
    local.get 5
    local.get 7
    local.get 8
    local.get 1
    local.get 3
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor
    local.set 1
    local.get 0
    i32.load
    call $~lib/matchstick-as/index/createMockedFunction
    local.set 2
    i32.const 1
    i32.const 32
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 3
    i32.load offset=4
    drop
    i32.const 6
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromI32
    local.set 4
    local.get 3
    i32.load offset=4
    local.get 4
    i32.store
    local.get 2
    local.get 3
    call $~lib/matchstick-as/index/MockedFunction#returns
    local.get 0
    i32.load offset=4
    call $~lib/matchstick-as/index/createMockedFunction
    local.set 3
    i32.const 1
    i32.const 32
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 0
    i32.load offset=4
    drop
    i32.const 18
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromI32
    local.set 2
    local.get 0
    i32.load offset=4
    local.get 2
    i32.store
    local.get 3
    local.get 0
    call $~lib/matchstick-as/index/MockedFunction#returns
    local.get 1)
  (func $tests/event-creators/createPoolCreatedEvent@varargs (type 10) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          global.get $~argumentsLength
          br_table 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        unreachable
      end
      i32.const 20
      i32.const 17
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=12
      local.get 0
      i32.const 0
      i32.store offset=16
      local.get 0
      i32.const 1648
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
      i32.store
      local.get 0
      i32.const 1648
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
      i32.store offset=4
      local.get 0
      i32.const 500
      i32.store offset=8
      local.get 0
      i32.const 875
      i32.store offset=12
      local.get 0
      i32.const 1648
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
      i32.store offset=16
    end
    local.get 0
    call $tests/event-creators/createPoolCreatedEvent)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    if  ;; label = @1
      i32.const 4016
      i32.const 3248
      i32.const 58
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/string/String.__eq (type 2) (param i32 i32) (result i32)
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
  (func $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set (type 3) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 3
        local.get 0
        i32.load
        i32.load offset=12
        i32.lt_s
        if  ;; label = @3
          local.get 0
          i32.load
          local.get 3
          call $~lib/array/Array<~lib/string/String>#__get
          i32.load
          local.get 1
          call $~lib/string/String.__eq
          if  ;; label = @4
            local.get 0
            i32.load
            local.get 3
            call $~lib/array/Array<~lib/string/String>#__get
            br 3 (;@1;)
          end
          local.get 3
          i32.const 1
          i32.add
          local.set 3
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
      local.tee 2
      i32.load offset=12
      local.tee 10
      i32.const 1
      i32.add
      local.tee 11
      local.tee 0
      local.get 2
      i32.load offset=8
      local.tee 8
      i32.const 2
      i32.shr_u
      i32.gt_u
      if  ;; label = @2
        local.get 0
        i32.const 268435455
        i32.gt_u
        if  ;; label = @3
          i32.const 1808
          i32.const 1856
          i32.const 17
          i32.const 48
          call $~lib/builtins/abort
          unreachable
        end
        local.get 2
        i32.load
        local.tee 12
        local.set 1
        local.get 8
        i32.const 1
        i32.shl
        local.tee 4
        i32.const 1073741820
        local.get 4
        i32.const 1073741820
        i32.lt_u
        select
        local.tee 4
        local.get 0
        i32.const 8
        local.get 0
        i32.const 8
        i32.gt_u
        select
        i32.const 2
        i32.shl
        local.tee 0
        local.get 0
        local.get 4
        i32.lt_u
        select
        local.tee 4
        i32.const 1073741804
        i32.gt_u
        if  ;; label = @3
          i32.const 1056
          i32.const 1120
          i32.const 99
          i32.const 30
          call $~lib/builtins/abort
          unreachable
        end
        local.get 4
        i32.const 16
        i32.add
        local.set 5
        local.get 1
        i32.const 16
        i32.sub
        local.tee 0
        i32.const 15
        i32.and
        i32.const 1
        local.get 0
        select
        if  ;; label = @3
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
        local.tee 9
        i32.load
        local.tee 7
        i32.add
        i32.eq
        local.set 6
        local.get 5
        i32.const 19
        i32.add
        i32.const -16
        i32.and
        i32.const 4
        i32.sub
        local.set 1
        local.get 5
        local.get 7
        i32.gt_u
        if  ;; label = @3
          local.get 6
          if  ;; label = @4
            local.get 5
            i32.const 1073741820
            i32.gt_u
            if  ;; label = @5
              i32.const 1056
              i32.const 1120
              i32.const 52
              i32.const 33
              call $~lib/builtins/abort
              unreachable
            end
            local.get 0
            local.get 1
            i32.add
            local.tee 5
            memory.size
            local.tee 7
            i32.const 16
            i32.shl
            i32.const 15
            i32.add
            i32.const -16
            i32.and
            local.tee 6
            i32.gt_u
            if  ;; label = @5
              local.get 7
              local.get 5
              local.get 6
              i32.sub
              i32.const 65535
              i32.add
              i32.const -65536
              i32.and
              i32.const 16
              i32.shr_u
              local.tee 6
              local.get 6
              local.get 7
              i32.lt_s
              select
              memory.grow
              i32.const 0
              i32.lt_s
              if  ;; label = @6
                local.get 6
                memory.grow
                i32.const 0
                i32.lt_s
                if  ;; label = @7
                  unreachable
                end
              end
            end
            local.get 5
            global.set $~lib/rt/stub/offset
            local.get 9
            local.get 1
            i32.store
          else
            local.get 1
            local.get 7
            i32.const 1
            i32.shl
            local.tee 5
            local.get 1
            local.get 5
            i32.gt_u
            select
            call $~lib/rt/stub/__alloc
            local.tee 1
            local.get 0
            local.get 7
            call $~lib/memory/memory.copy
            local.get 1
            local.set 0
          end
        else
          local.get 6
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.add
            global.set $~lib/rt/stub/offset
            local.get 9
            local.get 1
            i32.store
          end
        end
        local.get 0
        i32.const 4
        i32.sub
        local.get 4
        i32.store offset=16
        local.get 8
        local.get 0
        i32.const 16
        i32.add
        local.tee 0
        i32.add
        local.get 4
        local.get 8
        i32.sub
        call $~lib/memory/memory.fill
        local.get 0
        local.get 12
        i32.ne
        if  ;; label = @3
          local.get 2
          local.get 0
          i32.store
          local.get 2
          local.get 0
          i32.store offset=4
        end
        local.get 2
        local.get 4
        i32.store offset=8
      end
      local.get 2
      i32.load offset=4
      local.get 10
      i32.const 2
      i32.shl
      i32.add
      local.get 3
      i32.store
      local.get 2
      local.get 11
      i32.store offset=12
    end)
  (func $generated/schema/Token#constructor (type 0) (param i32) (result i32)
    (local i32 i32 i64)
    i32.const 4
    i32.const 35
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.tee 1
    local.set 2
    local.get 0
    i64.extend_i32_u
    local.set 3
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 6
    i32.store
    local.get 0
    local.get 3
    i64.store offset=8
    local.get 2
    i32.const 4144
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 1)
  (func $generated/UniswapV3Factory/ERC20/ERC20#constructor (type 0) (param i32) (result i32)
    (local i32)
    block (result i32)  ;; label = @1
      i32.const 8
      i32.const 38
      call $~lib/rt/stub/__new
      local.tee 1
      i32.eqz
      if  ;; label = @2
        i32.const 8
        i32.const 39
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
    i32.const 4176
    i32.store
    local.get 1
    local.get 0
    i32.store offset=4
    local.get 1)
  (func $~lib/typedarray/Uint8Array#__get (type 2) (param i32 i32) (result i32)
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
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32 (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
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
      i32.const 4496
      i32.const 3248
      i32.const 76
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    i32.const 255
    i32.const 0
    local.get 0
    i64.load offset=8
    i32.wrap_i64
    local.tee 2
    i32.load offset=8
    i32.const 0
    i32.gt_s
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 2
      local.get 2
      i32.load offset=8
      i32.const 1
      i32.sub
      call $~lib/typedarray/Uint8Array#__get
      i32.const 7
      i32.shr_u
      i32.const 1
      i32.eq
    else
      local.get 0
    end
    select
    local.set 0
    i32.const 4
    local.set 1
    loop  ;; label = @1
      local.get 1
      local.get 2
      i32.load offset=8
      i32.lt_s
      if  ;; label = @2
        local.get 2
        local.get 1
        call $~lib/typedarray/Uint8Array#__get
        local.get 0
        i32.ne
        if  ;; label = @3
          i32.const 4592
          local.get 2
          call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
          call $~lib/string/String#concat
          i32.const 4656
          call $~lib/string/String#concat
          i32.const 4704
          i32.const 150
          i32.const 9
          call $~lib/builtins/abort
          unreachable
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        br 1 (;@1;)
      end
    end
    i32.const 12
    i32.const 11
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor
    local.tee 1
    i32.const 0
    local.get 0
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 1
    local.get 0
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 2
    local.get 0
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 3
    local.get 0
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    local.get 2
    local.get 1
    i32.load offset=8
    local.get 2
    i32.load offset=8
    i32.lt_s
    select
    i32.load offset=8
    local.set 0
    loop  ;; label = @1
      local.get 0
      local.get 3
      i32.gt_s
      if  ;; label = @2
        local.get 1
        local.get 3
        local.get 2
        local.get 3
        call $~lib/typedarray/Uint8Array#__get
        call $~lib/typedarray/Uint8Array#__set
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end
    local.get 1
    i32.const 3
    call $~lib/typedarray/Uint8Array#__get
    i32.const 8
    i32.shl
    local.get 1
    i32.const 2
    call $~lib/typedarray/Uint8Array#__get
    i32.or
    i32.const 8
    i32.shl
    local.get 1
    i32.const 1
    call $~lib/typedarray/Uint8Array#__get
    i32.or
    i32.const 8
    i32.shl
    local.get 1
    i32.const 0
    call $~lib/typedarray/Uint8Array#__get
    i32.or)
  (func $generated/UniswapV3Factory/ERC20/ERC20#try_decimals (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    i32.const 32
    i32.const 4208
    call $~lib/rt/__newArray
    local.set 1
    local.get 0
    i32.load
    local.set 2
    local.get 0
    i32.load offset=4
    local.set 3
    i32.const 20
    i32.const 42
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    i32.const 3504
    i32.store offset=8
    local.get 0
    i32.const 3552
    i32.store offset=12
    local.get 0
    local.get 1
    i32.store offset=16
    block  ;; label = @1
      local.get 0
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.call
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const 4
        i32.const 40
        call $~lib/rt/stub/__new
        local.tee 0
        i32.const 0
        i32.store
        local.get 0
        i32.const 0
        i32.store
        br 1 (;@1;)
      end
      i32.const 4
      i32.const 40
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      i32.const 0
      i32.store
      i32.const 4
      i32.const 41
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      local.get 2
      i32.store
      local.get 0
      local.get 1
      i32.store
    end
    local.get 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 36
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      i32.const 0
      i32.store
      local.get 0
      return
    end
    local.get 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 4240
      i32.const 4336
      call $~lib/string/String#concat
      i32.const 3248
      i32.const 722
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.load
    i32.load
    i32.const 0
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32
    local.set 2
    i32.const 4
    i32.const 36
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.store
    i32.const 4
    i32.const 37
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    local.get 2
    i32.store
    local.get 0
    local.get 1
    i32.store
    local.get 0)
  (func $src/utils/safe-call-result/SafeCallResult.fromNumber (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 4240
      i32.const 4336
      call $~lib/string/String#concat
      i32.const 3248
      i32.const 722
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.load
    i32.load)
  (func $generated/schema/Token#set:decimals (type 1) (param i32 i32)
    (local i64)
    local.get 1
    i64.extend_i32_s
    local.set 2
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 1
    i32.store
    local.get 1
    local.get 2
    i64.store offset=8
    local.get 0
    i32.const 3504
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set)
  (func $generated/schema/Token#set:usdPrice (type 1) (param i32 i32)
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
    i32.const 4832
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set)
  (func $generated/schema/Pool#set:protocol (type 1) (param i32 i32)
    (local i64)
    local.get 1
    i64.extend_i32_u
    local.set 2
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    local.get 2
    i64.store offset=8
    local.get 0
    i32.const 5184
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set)
  (func $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get (type 2) (param i32 i32) (result i32)
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
        call $~lib/array/Array<~lib/string/String>#__get
        i32.load
        local.get 1
        call $~lib/string/String.__eq
        if  ;; label = @3
          local.get 0
          i32.load
          local.get 2
          call $~lib/array/Array<~lib/string/String>#__get
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
      i32.const 5680
      i32.const 5744
      i32.const 93
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/util/number/utoa32_dec_lut (type 3) (param i32 i32 i32)
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
        i32.const 6092
        i32.add
        i64.load32_u
        local.get 3
        i32.const 100
        i32.rem_u
        i32.const 2
        i32.shl
        i32.const 6092
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
          i32.const 6092
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
      i32.const 6092
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
  (func $~lib/util/number/itoa64 (type 11) (param i64) (result i32)
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
          i32.const 6092
          i32.add
          i64.load32_u
          local.get 6
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 6092
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
          i32.const 6092
          i32.add
          i64.load32_u
          local.get 5
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 6092
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
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData~anonymous|0 (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData)
  (func $~lib/util/string/joinStringArray (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.const 1
    i32.sub
    local.tee 7
    i32.const 0
    i32.lt_s
    if  ;; label = @1
      i32.const 3680
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
        i32.const 3680
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
      i32.const 8144
      i32.const 5744
      i32.const 64
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
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
                    i32.load
                    i32.const 5
                    i32.eq
                    if (result i32)  ;; label = @9
                      i32.const 0
                    else
                      local.get 0
                      i32.load
                      i32.const 1
                      i32.ne
                      if  ;; label = @10
                        i32.const 5856
                        i32.const 5744
                        i32.const 72
                        i32.const 5
                        call $~lib/builtins/abort
                        unreachable
                      end
                      local.get 0
                      i64.load offset=8
                      i32.wrap_i64
                    end
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
                      i32.const 7664
                      i32.const 5744
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
                i32.load
                i32.const 2
                i32.ne
                if  ;; label = @7
                  i32.const 7728
                  i32.const 5744
                  i32.const 103
                  i32.const 5
                  call $~lib/builtins/abort
                  unreachable
                end
                local.get 0
                i64.load offset=8
                i32.wrap_i64
                call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.toString
                return
              end
              i32.const 7888
              i32.const 7920
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
                  i32.const 7808
                  i32.const 5744
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
            local.tee 1
            i32.load
            i32.const 4
            i32.ne
            if  ;; label = @5
              i32.const 7952
              i32.const 5744
              i32.const 108
              i32.const 5
              call $~lib/builtins/abort
              unreachable
            end
            i32.const 0
            local.set 0
            local.get 1
            i64.load offset=8
            i32.wrap_i64
            local.tee 1
            i32.load offset=12
            local.tee 3
            i32.const 3
            i32.const 0
            call $~lib/rt/__newArray
            local.tee 4
            i32.load offset=4
            local.set 5
            loop  ;; label = @5
              local.get 0
              local.get 3
              local.get 1
              i32.load offset=12
              local.tee 2
              local.get 2
              local.get 3
              i32.gt_s
              select
              i32.lt_s
              if  ;; label = @6
                local.get 0
                i32.const 2
                i32.shl
                local.tee 2
                local.get 1
                i32.load offset=4
                i32.add
                i32.load
                local.set 6
                i32.const 3
                global.set $~argumentsLength
                local.get 2
                local.get 5
                i32.add
                local.get 6
                local.get 0
                local.get 1
                i32.const 8048
                i32.load
                call_indirect $0 (type 5)
                i32.store
                local.get 0
                i32.const 1
                i32.add
                local.set 0
                br 1 (;@5;)
              end
            end
            i32.const 8016
            local.get 4
            i32.load offset=4
            local.get 4
            i32.load offset=12
            i32.const 8080
            call $~lib/util/string/joinStringArray
            call $~lib/string/String#concat
            i32.const 8112
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
        i32.const 8224
        i32.const 5744
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
    i32.const 8388
    local.get 0
    i32.load
    call $~lib/util/number/itoa32
    i32.store
    i32.const 8384
    i32.const 8380
    i32.load
    i32.const 2
    i32.shr_u
    i32.const 3680
    call $~lib/util/string/joinStringArray)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 1612
    i32.load
    i32.ge_s
    if  ;; label = @1
      i32.const 8468
      local.get 0
      i32.load
      call $~lib/util/number/itoa32
      i32.store
      i32.const 8464
      i32.const 8460
      i32.load
      i32.const 2
      i32.shr_u
      i32.const 3680
      call $~lib/util/string/joinStringArray
      return
    end
    i32.const 1600
    local.get 0
    i32.load
    call $~lib/array/Array<~lib/string/String>#__get)
  (func $generated/schema/Pool#save (type 6) (param i32)
    (local i32)
    local.get 0
    i32.const 4144
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 5264
      i32.const 5360
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
        i32.const 5636
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        i32.store
        i32.const 5644
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        i32.store
        i32.const 5632
        i32.const 5628
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 3680
        call $~lib/util/string/joinStringArray
        i32.const 5360
        i32.const 81
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 8496
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
      local.get 0
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end)
  (func $generated/schema/Token#save (type 6) (param i32)
    (local i32)
    local.get 0
    i32.const 4144
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 8528
      i32.const 5360
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
        i32.const 8788
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        i32.store
        i32.const 8796
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        i32.store
        i32.const 8784
        i32.const 8780
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 3680
        call $~lib/util/string/joinStringArray
        i32.const 5360
        i32.const 15
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 4112
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
      local.get 0
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end)
  (func $src/v3-pools/mappings/factories/v3-factory/handleV3PoolCreated (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 4
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    local.set 7
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 0
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    local.set 3
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 1
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    local.set 4
    i32.const 4112
    local.get 3
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.set 5
    i32.const 4112
    local.get 4
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.set 6
    i32.const 4
    i32.const 33
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.tee 2
    local.set 1
    local.get 7
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 8
    i32.const 6
    i32.store
    local.get 8
    local.get 9
    i64.store offset=8
    local.get 1
    i32.const 4144
    local.get 8
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 5
    i32.eqz
    if  ;; label = @1
      local.get 3
      call $generated/schema/Token#constructor
      local.tee 5
      local.get 3
      call $generated/UniswapV3Factory/ERC20/ERC20#constructor
      call $generated/UniswapV3Factory/ERC20/ERC20#try_decimals
      call $src/utils/safe-call-result/SafeCallResult.fromNumber
      call $generated/schema/Token#set:decimals
      local.get 5
      global.get $src/utils/constants/ZERO_BIG_DECIMAL
      call $generated/schema/Token#set:usdPrice
    end
    local.get 6
    i32.eqz
    if  ;; label = @1
      local.get 4
      call $generated/schema/Token#constructor
      local.tee 6
      local.get 4
      call $generated/UniswapV3Factory/ERC20/ERC20#constructor
      call $generated/UniswapV3Factory/ERC20/ERC20#try_decimals
      call $src/utils/safe-call-result/SafeCallResult.fromNumber
      call $generated/schema/Token#set:decimals
      local.get 6
      global.get $src/utils/constants/ZERO_BIG_DECIMAL
      call $generated/schema/Token#set:usdPrice
    end
    local.get 3
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 6
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 3120
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 4
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 6
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 3360
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    local.get 0
    i32.store
    local.get 1
    i32.load
    i32.load offset=24
    i32.const 2
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32
    i64.extend_i32_s
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 1
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 4880
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    local.get 0
    i32.store
    local.get 1
    i32.load
    i32.load offset=24
    i32.const 3
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32
    i64.extend_i32_s
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 1
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 3424
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    global.get $src/utils/constants/ZERO_BIG_DECIMAL
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 4928
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    global.get $src/utils/constants/ZERO_BIG_DECIMAL
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 4992
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    global.get $src/utils/constants/ZERO_BIG_DECIMAL
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 2
    i32.store
    local.get 1
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 5056
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 0
    i32.load offset=16
    i32.load offset=40
    i64.extend_i32_u
    local.set 9
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 7
    i32.store
    local.get 0
    local.get 9
    i64.store offset=8
    local.get 2
    i32.const 5120
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 2
    i32.const 3680
    call $generated/schema/Pool#set:protocol
    i32.const 1
    i32.const 3
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 1
    i32.load offset=4
    drop
    local.get 7
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    local.set 0
    local.get 1
    i32.load offset=4
    local.get 0
    i32.store
    i32.const 5232
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/datasource/dataSource.create
    local.get 2
    call $generated/schema/Pool#save
    local.get 5
    call $generated/schema/Token#save
    local.get 6
    call $generated/schema/Token#save
    local.get 2)
  (func $src/v3-pools/mappings/factories/pancakeswap-v3-factory/handlePancakeSwapV3PoolCreated (type 6) (param i32)
    (local i32 i32 i32)
    local.get 0
    call $src/v3-pools/mappings/factories/v3-factory/handleV3PoolCreated
    local.set 2
    i32.const 8832
    i32.const 2464
    call $~lib/@graphprotocol/graph-ts/index/store.get
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 46
      call $~lib/rt/stub/__new
      call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
      local.tee 0
      local.set 3
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      i64.const 2464
      i64.store offset=8
      local.get 3
      i32.const 4144
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      i64.const 8880
      i64.store offset=8
      local.get 0
      i32.const 8928
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      i64.const 8960
      i64.store offset=8
      local.get 0
      i32.const 9040
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      i64.const 9072
      i64.store offset=8
      local.get 0
      i32.const 9312
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
      local.get 0
      i32.const 4144
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
      local.tee 1
      i32.eqz
      if  ;; label = @2
        i32.const 9344
        i32.const 5360
        i32.const 493
        i32.const 5
        call $~lib/builtins/abort
        unreachable
      end
      local.get 1
      if  ;; label = @2
        local.get 1
        i32.load
        if  ;; label = @3
          i32.const 9620
          local.get 1
          call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
          i32.store
          i32.const 9628
          local.get 1
          call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
          i32.store
          i32.const 9616
          i32.const 9612
          i32.load
          i32.const 2
          i32.shr_u
          i32.const 3680
          call $~lib/util/string/joinStringArray
          i32.const 5360
          i32.const 495
          i32.const 7
          call $~lib/builtins/abort
          unreachable
        end
        i32.const 8832
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
        local.get 0
        call $~lib/@graphprotocol/graph-ts/index/store.set
      end
    end
    local.get 2
    i32.const 5184
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
      i32.const 9664
      i32.const 5360
      i32.const 225
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
    end
    i32.const 2464
    call $~lib/string/String.__eq
    i32.eqz
    if  ;; label = @1
      local.get 2
      i32.const 2464
      call $generated/schema/Pool#set:protocol
      local.get 2
      call $generated/schema/Pool#save
    end)
  (func $~lib/matchstick-as/assert/assert.fieldEquals (type 7) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $~lib/matchstick-as/assert/_assert.fieldEquals
    i32.eqz
    if  ;; label = @1
      i32.const 9776
      i32.const 9872
      i32.const 45
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end)
  (func $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0~anonymous|1 (type 4)
    (local i32 i32)
    i32.const 0
    global.set $~argumentsLength
    call $tests/event-creators/createPoolCreatedEvent@varargs
    local.tee 1
    call $src/v3-pools/mappings/factories/pancakeswap-v3-factory/handlePancakeSwapV3PoolCreated
    i32.const 8832
    i32.const 2464
    i32.const 8928
    i32.const 8880
    call $~lib/matchstick-as/assert/assert.fieldEquals
    i32.const 8832
    i32.const 2464
    i32.const 9040
    i32.const 8960
    call $~lib/matchstick-as/assert/assert.fieldEquals
    i32.const 8832
    i32.const 2464
    i32.const 9312
    i32.const 9072
    call $~lib/matchstick-as/assert/assert.fieldEquals
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    local.get 1
    i32.store
    i32.const 8496
    local.get 0
    i32.load
    i32.load offset=24
    i32.const 4
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    i32.const 5184
    i32.const 2464
    call $~lib/matchstick-as/assert/assert.fieldEquals)
  (func $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0~anonymous|2 (type 4)
    (local i32 i32)
    i32.const 0
    global.set $~argumentsLength
    call $tests/event-creators/createPoolCreatedEvent@varargs
    local.tee 1
    call $src/v3-pools/mappings/factories/pancakeswap-v3-factory/handlePancakeSwapV3PoolCreated
    i32.const 4
    i32.const 34
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    local.get 1
    i32.store
    i32.const 8496
    local.get 0
    i32.load
    i32.load offset=24
    i32.const 4
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    i32.const 5184
    i32.const 2464
    call $~lib/matchstick-as/assert/assert.fieldEquals)
  (func $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0 (type 4)
    i32.const 2624
    i32.load
    i32.const 2656
    call $~lib/matchstick-as/index/_registerHook
    i32.const 2704
    i32.const 0
    i32.const 9952
    i32.load
    call $~lib/matchstick-as/index/_registerTest
    i32.const 9984
    i32.const 0
    i32.const 10288
    i32.load
    call $~lib/matchstick-as/index/_registerTest)
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
                                                                                                                                                                                                                                                                                                                                            i32.const 47
                                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                          i32.const 48
                                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        i32.const 49
                                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                      i32.const 50
                                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                    i32.const 13
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
                                                                                                                                                                                                                                                                                                                            i32.const 54
                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                          i32.const 55
                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                        i32.const 56
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
                                                                                                                                                                                                                                                                                                                i32.const 63
                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                              i32.const 65
                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                            i32.const 3
                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                          i32.const 67
                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                        i32.const 69
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
                                                                                                                                                                                                                                                                                              i32.const 78
                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                            i32.const 66
                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                          i32.const 82
                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                        i32.const 83
                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                      i32.const 84
                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                    i32.const 60
                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                  i32.const 62
                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                i32.const 64
                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                              i32.const 85
                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                            i32.const 70
                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                          i32.const 90
                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                        i32.const 71
                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                      i32.const 90
                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                    i32.const 91
                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                  i32.const 94
                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                i32.const 96
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
                                                                                                                                                                                                                                                  i32.const 30
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
                                                                                                                                                                                                                                          i32.const 106
                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                        i32.const 108
                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                      i32.const 88
                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                    i32.const 110
                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                  i32.const 111
                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                i32.const 116
                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                              i32.const 118
                                                                                                                                                                                                                              return
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                            i32.const 120
                                                                                                                                                                                                                            return
                                                                                                                                                                                                                          end
                                                                                                                                                                                                                          i32.const 122
                                                                                                                                                                                                                          return
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                        i32.const 123
                                                                                                                                                                                                                        return
                                                                                                                                                                                                                      end
                                                                                                                                                                                                                      i32.const 109
                                                                                                                                                                                                                      return
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                    i32.const 115
                                                                                                                                                                                                                    return
                                                                                                                                                                                                                  end
                                                                                                                                                                                                                  i32.const 119
                                                                                                                                                                                                                  return
                                                                                                                                                                                                                end
                                                                                                                                                                                                                i32.const 124
                                                                                                                                                                                                                return
                                                                                                                                                                                                              end
                                                                                                                                                                                                              i32.const 125
                                                                                                                                                                                                              return
                                                                                                                                                                                                            end
                                                                                                                                                                                                            i32.const 123
                                                                                                                                                                                                            return
                                                                                                                                                                                                          end
                                                                                                                                                                                                          i32.const 107
                                                                                                                                                                                                          return
                                                                                                                                                                                                        end
                                                                                                                                                                                                        i32.const 126
                                                                                                                                                                                                        return
                                                                                                                                                                                                      end
                                                                                                                                                                                                      i32.const 127
                                                                                                                                                                                                      return
                                                                                                                                                                                                    end
                                                                                                                                                                                                    i32.const 128
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
                                                                                                                                                                                            i32.const 133
                                                                                                                                                                                            return
                                                                                                                                                                                          end
                                                                                                                                                                                          i32.const 134
                                                                                                                                                                                          return
                                                                                                                                                                                        end
                                                                                                                                                                                        i32.const 135
                                                                                                                                                                                        return
                                                                                                                                                                                      end
                                                                                                                                                                                      i32.const 136
                                                                                                                                                                                      return
                                                                                                                                                                                    end
                                                                                                                                                                                    i32.const 112
                                                                                                                                                                                    return
                                                                                                                                                                                  end
                                                                                                                                                                                  i32.const 137
                                                                                                                                                                                  return
                                                                                                                                                                                end
                                                                                                                                                                                i32.const 117
                                                                                                                                                                                return
                                                                                                                                                                              end
                                                                                                                                                                              i32.const 138
                                                                                                                                                                              return
                                                                                                                                                                            end
                                                                                                                                                                            i32.const 114
                                                                                                                                                                            return
                                                                                                                                                                          end
                                                                                                                                                                          i32.const 121
                                                                                                                                                                          return
                                                                                                                                                                        end
                                                                                                                                                                        i32.const 139
                                                                                                                                                                        return
                                                                                                                                                                      end
                                                                                                                                                                      i32.const 140
                                                                                                                                                                      return
                                                                                                                                                                    end
                                                                                                                                                                    i32.const 86
                                                                                                                                                                    return
                                                                                                                                                                  end
                                                                                                                                                                  i32.const 87
                                                                                                                                                                  return
                                                                                                                                                                end
                                                                                                                                                                i32.const 59
                                                                                                                                                                return
                                                                                                                                                              end
                                                                                                                                                              i32.const 89
                                                                                                                                                              return
                                                                                                                                                            end
                                                                                                                                                            i32.const 141
                                                                                                                                                            return
                                                                                                                                                          end
                                                                                                                                                          i32.const 142
                                                                                                                                                          return
                                                                                                                                                        end
                                                                                                                                                        i32.const 88
                                                                                                                                                        return
                                                                                                                                                      end
                                                                                                                                                      i32.const 144
                                                                                                                                                      return
                                                                                                                                                    end
                                                                                                                                                    i32.const 147
                                                                                                                                                    return
                                                                                                                                                  end
                                                                                                                                                  i32.const 151
                                                                                                                                                  return
                                                                                                                                                end
                                                                                                                                                i32.const 150
                                                                                                                                                return
                                                                                                                                              end
                                                                                                                                              i32.const 167
                                                                                                                                              return
                                                                                                                                            end
                                                                                                                                            i32.const 172
                                                                                                                                            return
                                                                                                                                          end
                                                                                                                                          i32.const 174
                                                                                                                                          return
                                                                                                                                        end
                                                                                                                                        i32.const 182
                                                                                                                                        return
                                                                                                                                      end
                                                                                                                                      i32.const 166
                                                                                                                                      return
                                                                                                                                    end
                                                                                                                                    i32.const 184
                                                                                                                                    return
                                                                                                                                  end
                                                                                                                                  i32.const 178
                                                                                                                                  return
                                                                                                                                end
                                                                                                                                i32.const 185
                                                                                                                                return
                                                                                                                              end
                                                                                                                              i32.const 155
                                                                                                                              return
                                                                                                                            end
                                                                                                                            i32.const 30
                                                                                                                            return
                                                                                                                          end
                                                                                                                          i32.const 190
                                                                                                                          return
                                                                                                                        end
                                                                                                                        i32.const 143
                                                                                                                        return
                                                                                                                      end
                                                                                                                      i32.const 162
                                                                                                                      return
                                                                                                                    end
                                                                                                                    i32.const 145
                                                                                                                    return
                                                                                                                  end
                                                                                                                  i32.const 171
                                                                                                                  return
                                                                                                                end
                                                                                                                i32.const 161
                                                                                                                return
                                                                                                              end
                                                                                                              i32.const 189
                                                                                                              return
                                                                                                            end
                                                                                                            i32.const 153
                                                                                                            return
                                                                                                          end
                                                                                                          i32.const 192
                                                                                                          return
                                                                                                        end
                                                                                                        i32.const 148
                                                                                                        return
                                                                                                      end
                                                                                                      i32.const 149
                                                                                                      return
                                                                                                    end
                                                                                                    i32.const 195
                                                                                                    return
                                                                                                  end
                                                                                                  i32.const 154
                                                                                                  return
                                                                                                end
                                                                                                i32.const 152
                                                                                                return
                                                                                              end
                                                                                              i32.const 186
                                                                                              return
                                                                                            end
                                                                                            i32.const 191
                                                                                            return
                                                                                          end
                                                                                          i32.const 179
                                                                                          return
                                                                                        end
                                                                                        i32.const 160
                                                                                        return
                                                                                      end
                                                                                      i32.const 196
                                                                                      return
                                                                                    end
                                                                                    i32.const 158
                                                                                    return
                                                                                  end
                                                                                  i32.const 157
                                                                                  return
                                                                                end
                                                                                i32.const 168
                                                                                return
                                                                              end
                                                                              i32.const 170
                                                                              return
                                                                            end
                                                                            i32.const 169
                                                                            return
                                                                          end
                                                                          i32.const 156
                                                                          return
                                                                        end
                                                                        i32.const 165
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
                                                                i32.const 30
                                                                return
                                                              end
                                                              i32.const 159
                                                              return
                                                            end
                                                            i32.const 30
                                                            return
                                                          end
                                                          i32.const 173
                                                          return
                                                        end
                                                        i32.const 146
                                                        return
                                                      end
                                                      i32.const 180
                                                      return
                                                    end
                                                    i32.const 198
                                                    return
                                                  end
                                                  i32.const 176
                                                  return
                                                end
                                                i32.const 177
                                                return
                                              end
                                              i32.const 175
                                              return
                                            end
                                            i32.const 164
                                            return
                                          end
                                          i32.const 193
                                          return
                                        end
                                        i32.const 163
                                        return
                                      end
                                      i32.const 199
                                      return
                                    end
                                    i32.const 183
                                    return
                                  end
                                  i32.const 194
                                  return
                                end
                                i32.const 200
                                return
                              end
                              i32.const 197
                              return
                            end
                            i32.const 201
                            return
                          end
                          i32.const 204
                          return
                        end
                        i32.const 202
                        return
                      end
                      i32.const 203
                      return
                    end
                    i32.const 205
                    return
                  end
                  i32.const 206
                  return
                end
                i32.const 207
                return
              end
              i32.const 208
              return
            end
            i32.const 209
            return
          end
          i32.const 30
          return
        end
        i32.const 210
        return
      end
      i32.const 88
      return
    end
    i32.const 0)
  (func $node_modules/@graphprotocol/graph-ts/global/global/allocate (type 0) (param i32) (result i32)
    local.get 0
    call $~lib/rt/stub/__alloc)
  (func $~start (type 4)
    global.get $~started
    if  ;; label = @1
      return
    end
    i32.const 1
    global.set $~started
    i32.const 10444
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
    i32.const 2560
    i32.const 10320
    i32.load
    call $~lib/matchstick-as/index/_registerDescribe
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
  (elem $0 (i32.const 1) func $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0~anonymous|0 $~lib/@graphprotocol/graph-ts/common/value/Value#displayData~anonymous|0 $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0~anonymous|1 $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0~anonymous|2 $start:tests/v3-pools/mappings/factories/pancakeswap-v3-factory.test~anonymous|0)
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
  (data (;54;) (i32.const 2540) "<")
  (data (;55;) (i32.const 2552) "\01\00\00\00,\00\00\00p\00a\00n\00c\00a\00k\00e\00s\00w\00a\00p\00-\00v\003\00-\00f\00a\00c\00t\00o\00r\00y")
  (data (;56;) (i32.const 2604) "\1c")
  (data (;57;) (i32.const 2616) "\10\00\00\00\08\00\00\00\01")
  (data (;58;) (i32.const 2636) ",")
  (data (;59;) (i32.const 2648) "\01\00\00\00\14\00\00\00b\00e\00f\00o\00r\00e\00E\00a\00c\00h")
  (data (;60;) (i32.const 2684) "|\01")
  (data (;61;) (i32.const 2696) "\01\00\00\00d\01\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00h\00a\00n\00d\00l\00e\00r\00 \00i\00s\00 \00c\00a\00l\00l\00e\00d\00 \00a\00n\00d\00 \00t\00h\00e\00r\00e\00\0a\00 \00 \00 \00 \00 \00 \00 \00 \00i\00s\00n\00'\00t\00 \00a\00n\00 \00a\00l\00r\00e\00a\00d\00y\00 \00P\00a\00n\00c\00a\00k\00e\00S\00w\00a\00p\00 \00c\00r\00e\00a\00t\00e\00d\00 \00p\00r\00o\00t\00o\00c\00o\00l\00,\00 \00i\00t\00\0a\00 \00 \00 \00 \00 \00 \00 \00 \00s\00h\00o\00u\00l\00d\00 \00c\00r\00e\00a\00t\00e\00 \00o\00n\00e\00 \00w\00i\00t\00h\00 \00t\00h\00e\00 \00c\00o\00r\00r\00e\00c\00t\00 \00v\00a\00l\00u\00e\00s\00\0a\00 \00 \00 \00 \00 \00 \00 \00 \00a\00n\00d\00 \00a\00s\00s\00i\00g\00n\00 \00i\00t\00 \00t\00o\00 \00t\00h\00e\00 \00p\00o\00o\00l")
  (data (;62;) (i32.const 3068) "\1c")
  (data (;63;) (i32.const 3100) "\1c")
  (data (;64;) (i32.const 3112) "\01\00\00\00\0c\00\00\00t\00o\00k\00e\00n\000")
  (data (;65;) (i32.const 3132) "\5c")
  (data (;66;) (i32.const 3144) "\01\00\00\00J\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00m\00u\00s\00t\00 \00c\00o\00n\00t\00a\00i\00n\00 \00e\00x\00a\00c\00t\00l\00y\00 \002\000\00 \00b\00y\00t\00e\00s")
  (data (;67;) (i32.const 3228) "l")
  (data (;68;) (i32.const 3240) "\01\00\00\00\5c\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00h\00a\00i\00n\00/\00e\00t\00h\00e\00r\00e\00u\00m\00.\00t\00s")
  (data (;69;) (i32.const 3340) "\1c")
  (data (;70;) (i32.const 3352) "\01\00\00\00\0c\00\00\00t\00o\00k\00e\00n\001")
  (data (;71;) (i32.const 3372) "\1c")
  (data (;72;) (i32.const 3384) "\01\00\00\00\06\00\00\00f\00e\00e")
  (data (;73;) (i32.const 3404) ",")
  (data (;74;) (i32.const 3416) "\01\00\00\00\16\00\00\00t\00i\00c\00k\00S\00p\00a\00c\00i\00n\00g")
  (data (;75;) (i32.const 3452) "\1c")
  (data (;76;) (i32.const 3464) "\01\00\00\00\08\00\00\00p\00o\00o\00l")
  (data (;77;) (i32.const 3484) ",")
  (data (;78;) (i32.const 3496) "\01\00\00\00\10\00\00\00d\00e\00c\00i\00m\00a\00l\00s")
  (data (;79;) (i32.const 3532) "<")
  (data (;80;) (i32.const 3544) "\01\00\00\00$\00\00\00d\00e\00c\00i\00m\00a\00l\00s\00(\00)\00:\00(\00u\00i\00n\00t\008\00)")
  (data (;81;) (i32.const 3596) "\1c")
  (data (;82;) (i32.const 3628) "\1c")
  (data (;83;) (i32.const 3660) "\1c")
  (data (;84;) (i32.const 3672) "\01")
  (data (;85;) (i32.const 3692) "\5c")
  (data (;86;) (i32.const 3704) "\01\00\00\00J\00\00\00T\00o\00o\00 \00f\00e\00w\00 \00a\00r\00g\00u\00m\00e\00n\00t\00s\00 \00f\00o\00r\00 \00f\00o\00r\00m\00a\00t\00 \00s\00t\00r\00i\00n\00g\00:\00 ")
  (data (;87;) (i32.const 3788) "L")
  (data (;88;) (i32.const 3800) "\01\00\00\002\00\00\00~\00l\00i\00b\00/\00m\00a\00t\00c\00h\00s\00t\00i\00c\00k\00-\00a\00s\00/\00l\00o\00g\00.\00t\00s")
  (data (;89;) (i32.const 3868) "|")
  (data (;90;) (i32.const 3880) "\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
  (data (;91;) (i32.const 3996) "\5c")
  (data (;92;) (i32.const 4008) "\01\00\00\00@\00\00\00E\00t\00h\00e\00r\00e\00u\00m\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00a\00d\00d\00r\00e\00s\00s")
  (data (;93;) (i32.const 4092) "\1c")
  (data (;94;) (i32.const 4104) "\01\00\00\00\0a\00\00\00T\00o\00k\00e\00n")
  (data (;95;) (i32.const 4124) "\1c")
  (data (;96;) (i32.const 4136) "\01\00\00\00\04\00\00\00i\00d")
  (data (;97;) (i32.const 4156) "\1c")
  (data (;98;) (i32.const 4168) "\01\00\00\00\0a\00\00\00E\00R\00C\002\000")
  (data (;99;) (i32.const 4188) "\1c")
  (data (;100;) (i32.const 4220) "\5c")
  (data (;101;) (i32.const 4232) "\01\00\00\00F\00\00\00a\00c\00c\00e\00s\00s\00e\00d\00 \00v\00a\00l\00u\00e\00 \00o\00f\00 \00a\00 \00r\00e\00v\00e\00r\00t\00e\00d\00 \00c\00a\00l\00l\00,\00 ")
  (data (;102;) (i32.const 4316) "\9c")
  (data (;103;) (i32.const 4328) "\01\00\00\00\88\00\00\00p\00l\00e\00a\00s\00e\00 \00c\00h\00e\00c\00k\00 \00t\00h\00e\00 \00`\00r\00e\00v\00e\00r\00t\00e\00d\00`\00 \00f\00i\00e\00l\00d\00 \00b\00e\00f\00o\00r\00e\00 \00a\00c\00c\00e\00s\00s\00i\00n\00g\00 \00t\00h\00e\00 \00`\00v\00a\00l\00u\00e\00`\00 \00f\00i\00e\00l\00d")
  (data (;104;) (i32.const 4476) "\5c")
  (data (;105;) (i32.const 4488) "\01\00\00\00J\00\00\00E\00t\00h\00e\00r\00e\00u\00m\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\00n\00t\00 \00o\00r\00 \00u\00i\00n\00t\00.")
  (data (;106;) (i32.const 4572) "<")
  (data (;107;) (i32.const 4584) "\01\00\00\00(\00\00\00o\00v\00e\00r\00f\00l\00o\00w\00 \00c\00o\00n\00v\00e\00r\00t\00i\00n\00g\00 ")
  (data (;108;) (i32.const 4636) ",")
  (data (;109;) (i32.const 4648) "\01\00\00\00\0e\00\00\00 \00t\00o\00 \00i\003\002")
  (data (;110;) (i32.const 4684) "|")
  (data (;111;) (i32.const 4696) "\01\00\00\00d\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00c\00o\00l\00l\00e\00c\00t\00i\00o\00n\00s\00.\00t\00s")
  (data (;112;) (i32.const 4812) ",")
  (data (;113;) (i32.const 4824) "\01\00\00\00\10\00\00\00u\00s\00d\00P\00r\00i\00c\00e")
  (data (;114;) (i32.const 4860) ",")
  (data (;115;) (i32.const 4872) "\01\00\00\00\0e\00\00\00f\00e\00e\00T\00i\00e\00r")
  (data (;116;) (i32.const 4908) "<")
  (data (;117;) (i32.const 4920) "\01\00\00\00&\00\00\00t\00o\00t\00a\00l\00V\00a\00l\00u\00e\00L\00o\00c\00k\00e\00d\00U\00S\00D")
  (data (;118;) (i32.const 4972) "<")
  (data (;119;) (i32.const 4984) "\01\00\00\00,\00\00\00t\00o\00t\00a\00l\00V\00a\00l\00u\00e\00L\00o\00c\00k\00e\00d\00T\00o\00k\00e\00n\000")
  (data (;120;) (i32.const 5036) "<")
  (data (;121;) (i32.const 5048) "\01\00\00\00,\00\00\00t\00o\00t\00a\00l\00V\00a\00l\00u\00e\00L\00o\00c\00k\00e\00d\00T\00o\00k\00e\00n\001")
  (data (;122;) (i32.const 5100) "<")
  (data (;123;) (i32.const 5112) "\01\00\00\00$\00\00\00c\00r\00e\00a\00t\00e\00d\00A\00t\00T\00i\00m\00e\00s\00t\00a\00m\00p")
  (data (;124;) (i32.const 5164) ",")
  (data (;125;) (i32.const 5176) "\01\00\00\00\10\00\00\00p\00r\00o\00t\00o\00c\00o\00l")
  (data (;126;) (i32.const 5212) "\1c")
  (data (;127;) (i32.const 5224) "\01\00\00\00\0c\00\00\00V\003\00P\00o\00o\00l")
  (data (;128;) (i32.const 5244) "\5c")
  (data (;129;) (i32.const 5256) "\01\00\00\00J\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00P\00o\00o\00l\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;130;) (i32.const 5340) "<")
  (data (;131;) (i32.const 5352) "\01\00\00\00&\00\00\00g\00e\00n\00e\00r\00a\00t\00e\00d\00/\00s\00c\00h\00e\00m\00a\00.\00t\00s")
  (data (;132;) (i32.const 5404) "\9c")
  (data (;133;) (i32.const 5416) "\01\00\00\00\80\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00P\00o\00o\00l\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00B\00y\00t\00e\00s\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;134;) (i32.const 5564) ",")
  (data (;135;) (i32.const 5576) "\01\00\00\00\1a\00\00\00'\00 \00i\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 ")
  (data (;136;) (i32.const 5612) ",")
  (data (;137;) (i32.const 5624) "+\00\00\00\14\00\00\000\15\00\00\00\00\00\00\d0\15\00\00\00\00\00\00`\0e")
  (data (;138;) (i32.const 5660) "<")
  (data (;139;) (i32.const 5672) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00s\00t\00r\00i\00n\00g\00.")
  (data (;140;) (i32.const 5724) "l")
  (data (;141;) (i32.const 5736) "\01\00\00\00X\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00v\00a\00l\00u\00e\00.\00t\00s")
  (data (;142;) (i32.const 5836) "<")
  (data (;143;) (i32.const 5848) "\01\00\00\00(\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\003\002\00.")
  (data (;144;) (i32.const 5900) "|")
  (data (;145;) (i32.const 5912) "\01\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
  (data (;146;) (i32.const 6028) "<")
  (data (;147;) (i32.const 6040) "\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
  (data (;148;) (i32.const 6092) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
  (data (;149;) (i32.const 6492) "\1c\04")
  (data (;150;) (i32.const 6504) "\01\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
  (data (;151;) (i32.const 7548) "\5c")
  (data (;152;) (i32.const 7560) "\01\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
  (data (;153;) (i32.const 7644) "<")
  (data (;154;) (i32.const 7656) "\01\00\00\00(\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\006\004\00.")
  (data (;155;) (i32.const 7708) "L")
  (data (;156;) (i32.const 7720) "\01\00\00\004\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00.")
  (data (;157;) (i32.const 7788) "L")
  (data (;158;) (i32.const 7800) "\01\00\00\00.\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00b\00o\00o\00l\00e\00a\00n\00.")
  (data (;159;) (i32.const 7868) "\1c")
  (data (;160;) (i32.const 7880) "\01\00\00\00\08\00\00\00t\00r\00u\00e")
  (data (;161;) (i32.const 7900) "\1c")
  (data (;162;) (i32.const 7912) "\01\00\00\00\0a\00\00\00f\00a\00l\00s\00e")
  (data (;163;) (i32.const 7932) "<")
  (data (;164;) (i32.const 7944) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00a\00r\00r\00a\00y\00.")
  (data (;165;) (i32.const 7996) "\1c")
  (data (;166;) (i32.const 8008) "\01\00\00\00\02\00\00\00[")
  (data (;167;) (i32.const 8028) "\1c")
  (data (;168;) (i32.const 8040) "-\00\00\00\08\00\00\00\02")
  (data (;169;) (i32.const 8060) "\1c")
  (data (;170;) (i32.const 8072) "\01\00\00\00\04\00\00\00,\00 ")
  (data (;171;) (i32.const 8092) "\1c")
  (data (;172;) (i32.const 8104) "\01\00\00\00\02\00\00\00]")
  (data (;173;) (i32.const 8124) "L")
  (data (;174;) (i32.const 8136) "\01\00\00\004\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00b\00y\00t\00e\00 \00a\00r\00r\00a\00y\00.")
  (data (;175;) (i32.const 8204) "<")
  (data (;176;) (i32.const 8216) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00B\00i\00g\00I\00n\00t\00.")
  (data (;177;) (i32.const 8268) "<")
  (data (;178;) (i32.const 8280) "\01\00\00\00*\00\00\00U\00n\00k\00n\00o\00w\00n\00 \00d\00a\00t\00a\00 \00(\00k\00i\00n\00d\00 \00=\00 ")
  (data (;179;) (i32.const 8332) "\1c")
  (data (;180;) (i32.const 8344) "\01\00\00\00\02\00\00\00)")
  (data (;181;) (i32.const 8364) "\1c")
  (data (;182;) (i32.const 8376) "+\00\00\00\0c\00\00\00` \00\00\00\00\00\00\a0 ")
  (data (;183;) (i32.const 8396) ",")
  (data (;184;) (i32.const 8408) "\01\00\00\00\12\00\00\00U\00n\00k\00n\00o\00w\00n\00 \00(")
  (data (;185;) (i32.const 8444) "\1c")
  (data (;186;) (i32.const 8456) "+\00\00\00\0c\00\00\00\e0 \00\00\00\00\00\00\a0 ")
  (data (;187;) (i32.const 8476) "\1c")
  (data (;188;) (i32.const 8488) "\01\00\00\00\08\00\00\00P\00o\00o\00l")
  (data (;189;) (i32.const 8508) "\5c")
  (data (;190;) (i32.const 8520) "\01\00\00\00L\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00T\00o\00k\00e\00n\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;191;) (i32.const 8604) "\9c")
  (data (;192;) (i32.const 8616) "\01\00\00\00\82\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00T\00o\00k\00e\00n\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00B\00y\00t\00e\00s\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;193;) (i32.const 8764) ",")
  (data (;194;) (i32.const 8776) "+\00\00\00\14\00\00\00\b0!\00\00\00\00\00\00\d0\15\00\00\00\00\00\00`\0e")
  (data (;195;) (i32.const 8812) ",")
  (data (;196;) (i32.const 8824) "\01\00\00\00\10\00\00\00P\00r\00o\00t\00o\00c\00o\00l")
  (data (;197;) (i32.const 8860) ",")
  (data (;198;) (i32.const 8872) "\01\00\00\00\16\00\00\00P\00a\00n\00c\00a\00k\00e\00S\00w\00a\00p")
  (data (;199;) (i32.const 8908) "\1c")
  (data (;200;) (i32.const 8920) "\01\00\00\00\08\00\00\00n\00a\00m\00e")
  (data (;201;) (i32.const 8940) "L")
  (data (;202;) (i32.const 8952) "\01\00\00\006\00\00\00h\00t\00t\00p\00s\00:\00/\00/\00p\00a\00n\00c\00a\00k\00e\00s\00w\00a\00p\00.\00f\00i\00n\00a\00n\00c\00e")
  (data (;203;) (i32.const 9020) "\1c")
  (data (;204;) (i32.const 9032) "\01\00\00\00\06\00\00\00u\00r\00l")
  (data (;205;) (i32.const 9052) "\ec")
  (data (;206;) (i32.const 9064) "\01\00\00\00\da\00\00\00h\00t\00t\00p\00s\00:\00/\00/\00r\00a\00w\00.\00g\00i\00t\00h\00u\00b\00u\00s\00e\00r\00c\00o\00n\00t\00e\00n\00t\00.\00c\00o\00m\00/\00t\00r\00u\00s\00t\00w\00a\00l\00l\00e\00t\00/\00a\00s\00s\00e\00t\00s\00/\00r\00e\00f\00s\00/\00h\00e\00a\00d\00s\00/\00m\00a\00s\00t\00e\00r\00/\00d\00a\00p\00p\00s\00/\00e\00x\00c\00h\00a\00n\00g\00e\00.\00p\00a\00n\00c\00a\00k\00e\00s\00w\00a\00p\00.\00f\00i\00n\00a\00n\00c\00e\00.\00p\00n\00g")
  (data (;207;) (i32.const 9292) "\1c")
  (data (;208;) (i32.const 9304) "\01\00\00\00\08\00\00\00l\00o\00g\00o")
  (data (;209;) (i32.const 9324) "l")
  (data (;210;) (i32.const 9336) "\01\00\00\00R\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00P\00r\00o\00t\00o\00c\00o\00l\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;211;) (i32.const 9436) "\9c")
  (data (;212;) (i32.const 9448) "\01\00\00\00\8a\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00P\00r\00o\00t\00o\00c\00o\00l\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00S\00t\00r\00i\00n\00g\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;213;) (i32.const 9596) ",")
  (data (;214;) (i32.const 9608) "+\00\00\00\14\00\00\00\f0$\00\00\00\00\00\00\d0\15\00\00\00\00\00\00`\0e")
  (data (;215;) (i32.const 9644) "l")
  (data (;216;) (i32.const 9656) "\01\00\00\00P\00\00\00C\00a\00n\00n\00o\00t\00 \00r\00e\00t\00u\00r\00n\00 \00n\00u\00l\00l\00 \00f\00o\00r\00 \00a\00 \00r\00e\00q\00u\00i\00r\00e\00d\00 \00f\00i\00e\00l\00d\00.")
  (data (;217;) (i32.const 9756) "\5c")
  (data (;218;) (i32.const 9768) "\01\00\00\00D\00\00\00a\00s\00s\00e\00r\00t\00.\00f\00i\00e\00l\00d\00E\00q\00u\00a\00l\00s\00 \00A\00s\00s\00e\00r\00t\00i\00o\00n\00 \00E\00r\00r\00o\00r")
  (data (;219;) (i32.const 9852) "L")
  (data (;220;) (i32.const 9864) "\01\00\00\008\00\00\00~\00l\00i\00b\00/\00m\00a\00t\00c\00h\00s\00t\00i\00c\00k\00-\00a\00s\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s")
  (data (;221;) (i32.const 9932) "\1c")
  (data (;222;) (i32.const 9944) "\10\00\00\00\08\00\00\00\03")
  (data (;223;) (i32.const 9964) ",\01")
  (data (;224;) (i32.const 9976) "\01\00\00\00\10\01\00\00W\00h\00e\00n\00 \00t\00h\00e\00 \00h\00a\00n\00d\00l\00e\00r\00 \00i\00s\00 \00c\00a\00l\00l\00e\00d\00 \00a\00n\00d\00 \00t\00h\00e\00 \00p\00o\00o\00l\00 \00a\00s\00s\00i\00g\00n\00e\00d\00 \00p\00r\00o\00t\00o\00c\00o\00l\00 \00i\00d\00\0a\00 \00 \00 \00 \00i\00s\00 \00n\00o\00t\00 \00t\00h\00e\00 \00P\00a\00n\00c\00a\00k\00e\00S\00w\00a\00p\00 \00o\00n\00e\00,\00 \00i\00t\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00u\00p\00d\00a\00t\00e\00d\00 \00t\00o\00 \00t\00h\00e\00 \00p\00a\00n\00c\00a\00k\00e\00s\00w\00a\00p\00 \00o\00n\00e")
  (data (;225;) (i32.const 10268) "\1c")
  (data (;226;) (i32.const 10280) "\10\00\00\00\08\00\00\00\04")
  (data (;227;) (i32.const 10300) "\1c")
  (data (;228;) (i32.const 10312) "\10\00\00\00\08\00\00\00\05")
  (data (;229;) (i32.const 10332) "<")
  (data (;230;) (i32.const 10348) "(\00\00\00\a0\04\00\00\c0\04\00\00\e0\04\00\00\10\05\00\000\05\00\00P\05\00\00p\05\00\00\90\05\00\00\b0\05\00\00\d0\05")
  (data (;231;) (i32.const 10396) ",")
  (data (;232;) (i32.const 10408) "\03\00\00\00\10\00\00\00p(\00\00p(\00\00(\00\00\00\0a"))
