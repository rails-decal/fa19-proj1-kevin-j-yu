class PokemonsController < ApplicationController
    def capture
        pokemon = Pokemon.find(params[:id])
        pokemon.trainer = current_trainer
        pokemon.save
        redirect_to '/'
    end

    def damage
        pokemon = Pokemon.find(params[:id])
        trainer = pokemon.trainer
        pokemon.health -= 10
        pokemon.save
        if pokemon.health == 0
            pokemon.destroy
        end
        redirect_to "/trainers/#{trainer.id}"
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        @pokemon = Pokemon.create pokemon_params
        @pokemon.health = 100
        @pokemon.level = 1
        @pokemon.trainer = current_trainer
        if @pokemon.save
            redirect_to "/trainers/#{current_trainer.id}"
        else
            flash[:error] = @pokemon.errors.full_messages.to_sentence
            redirect_to "/pokemons/new"
        end
    end

    private
        def pokemon_params
            params.require(:pokemon).permit(:name, :ndex)
        end
end
