<template>
    <div class="list">
      <h6>{{ list.title }}</h6>

      <draggable v-model="list.cards" :options="{group: 'cards'}" class="dragArea" @change="cardMoved">
        <card v-for="card in list.cards" :card="card" :list='list'></card>
      </draggable>

      <a v-if="!editing" v-on:click="startEditing">Add a card</a>
      <textarea v-if="editing" ref="message" v-model="message" class="form-control" ></textarea>
      <button v-if="editing" v-on:click="submitMessage" class="btn btn-secondary">Add</button>
      <a v-if="editing" v-on:click="editing=false">Cancel</a>
    </div>
</template>

<script>
import draggable from 'vuedraggable'
import card from 'components/card'

export default{
  components: { card, draggable },
  props: ["list"],

  data: function(){
    return {
      editing: false,
      message: ""
    }
  },

  methods: {
    startEditing: function() {
      this.editing = true
      this.$nextTick(() => { this.$refs.message.focus() })
    },

    cardMoved: function(event) {
      const evt = event.added || event.moved
      if (evt == undefined){ return }

      const element = evt.element
      const list_index = window.store.lists.findIndex((list) => {
        return list.cards.find((card) => {
        return card.id == element.id
        })
      })

      var data = new FormData
      data.append("card[list_id]", window.store.lists[list_index].id)
      data.append("card[position]", evt.newIndex + 1)

      Rails.ajax({
        url: `/cards/${element.id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json",
      })
    },

    submitMessage: function(){
      var data = new FormData
      data.append("card[list_id]", this.list.id)
      data.append("card[title]", this.message)

      Rails.ajax({
        url: "/cards",
        type: "POST",
        data: data,
        dataType: "json",
        success: (data) => {
          const index = window.store.lists.findIndex(item => item.id == this.list.id)
          window.store.lists[index].cards.push(data)
          this.message = ""
          this.$nextTick(() => { this.$refs.message.focus() })
        }
      })
    }
  }
}

</script>

<style scoped>
</style>