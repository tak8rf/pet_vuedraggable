<template>
<div>
    <div @click="editing=true" class="card card-body mb-3">
        {{ card.title }}
    </div>

    <div v-if='editing' class="modal-backdrop show"></div>

    <div v-if='editing' @click="closeModal" class="modal show" style="display: block">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ card.title }}</h5>
          </div>
          <div class="modal-body">
            <input v-model="title" class="form-control"></input>
            <input v-model="position" class="form-control"></input>
          </div>
          <div class="modal-footer">
            <button @click="save" type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</template>

<script>
export default {
    props: ['card', 'list'],
    data: function() {
        return {
            editing: false,
            title: this.card.title,
            position: this.card.position,
        }
    },

    methods: {
        closeModal: function(event) {
            if (event.target.classList.contains("modal")) { this.editing = false }
        },
        
        save: function() {
            var data = new FormData
            data.append("card[title]", this.title)
            data.append("card[position]", this.position)

            Rails.ajax({
                beforeSend: () => true,
                url: `/cards/${this.card.id}`,
                type: "PATCH",
                data: data,
                dataType: "json",
                success: (data) => {
                    const list_index = window.store.lists.findIndex((item) => item.id == this.list.id)
                    const card_index = window.store.lists[list_index].cards.findIndex((item) => item.id == this.card.id)
                    window.store.lists[list_index].cards.splice(card_index, 1, data)

                    this.editing = false
                }
            })
        },
    }
}
</script>

<style scoped>
</style>      