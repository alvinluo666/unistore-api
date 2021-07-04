<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'description' => null,
            'images' => ['https://picsum.photos/id/'.$this->faker->numberBetween($min=100,$max=250).'/300/300','https://picsum.photos/id/'.$this->faker->numberBetween($min=100,$max=250).'/300/300'],
            'category_id' => $this->faker->numberBetween($min=0,$max=50),
            'service' => null,
            'price' => $this->faker->randomFloat($nbMaxDecimals = NULL, $min = 100, $max = 10000)
        ];
    }
}
